package com.earth.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.earth.mapper.AddressDongMapper;
import com.earth.mapper.AddressSidoMapper;
import com.earth.mapper.AddressSigoonMapper;
import com.earth.mapper.DanggeunInfoMapper;
import com.earth.mapper.DanggeunPhotoMapper;
import com.earth.mapper.DanggeunTypeMapper;
import com.earth.mapper.DanggeunZzimMapper;
import com.earth.upload.S3UploadService;
import com.earth.domain.DanggeunInfoDTO;
import com.earth.domain.DanggeunPhotoDTO;
import com.earth.domain.DanggeunSearchItem;
import com.earth.domain.DanggeunTypeDTO;
import com.earth.domain.DanggeunZzimDTO;

@Service
public class DanggeunServiceImpl implements DanggeunService {

	private DanggeunInfoMapper danggeunInfoMapper;
	private DanggeunTypeMapper danggeunTypeMapper;
	private DanggeunPhotoMapper danggeunPhotoMapper;
	private DanggeunZzimMapper danggeunZzimMapper;
	private AddressSidoMapper addressSidoMapper;
	private AddressSigoonMapper addressSigoonMapper;
	private AddressDongMapper addressDongMapper;
	private S3UploadService s3UploadService;
	
	public DanggeunServiceImpl(DanggeunInfoMapper danggeunInfoMapper, DanggeunTypeMapper danggeunTypeMapper,
			DanggeunPhotoMapper danggeunPhotoMapper, DanggeunZzimMapper danggeunZzimMapper, AddressSidoMapper addressSidoMapper,
			AddressSigoonMapper addressSigoonMapper, AddressDongMapper addressDongMapper, S3UploadService s3UploadService) {
		this.danggeunInfoMapper = danggeunInfoMapper;
		this.danggeunTypeMapper = danggeunTypeMapper;
		this.danggeunPhotoMapper = danggeunPhotoMapper;
		this.danggeunZzimMapper = danggeunZzimMapper;
		this.addressSidoMapper = addressSidoMapper;
		this.addressSigoonMapper = addressSigoonMapper;
		this.addressDongMapper = addressDongMapper;
		this.s3UploadService = s3UploadService;
	}

	@Override
	public int countDanggeunListByOption(DanggeunSearchItem dsc) throws Exception {
		return danggeunInfoMapper.selectByOptionCnt(dsc);
	}

	@Override
	public List<DanggeunInfoDTO> readDanggeunListByOption(DanggeunSearchItem dsc, String login_nickname)
			throws Exception {
		dsc.setLogin_nickname(login_nickname);
		return danggeunInfoMapper.selectByOption(dsc);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public DanggeunInfoDTO readDanggeun(Integer id, String login_nickname) throws Exception {
		Map map = new HashMap();
		map.put("id", id);
		map.put("login_nickname", login_nickname);
		DanggeunInfoDTO danggeunInfoDTO = danggeunInfoMapper.select(map);
		danggeunInfoMapper.increaseViewCnt(id);
		return danggeunInfoDTO;
	}

	//사진 추가하는거 넣어야 될듯?
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void modifyDangguen(DanggeunInfoDTO danggeunInfoDTO, Map<Integer, String> map) throws Exception {
		danggeunInfoDTO.setType_name(danggeunTypeMapper.select(danggeunInfoDTO.getType_id()).getName());
		danggeunInfoDTO.setSido_name(addressSidoMapper.select(danggeunInfoDTO.getSido_code()).getName());
		danggeunInfoDTO.setSigoon_name(addressSigoonMapper.select(danggeunInfoDTO.getSigoon_code()).getName());
		danggeunInfoDTO.setDong_name(addressDongMapper.select(danggeunInfoDTO.getDong_code()).getName());


		List<DanggeunPhotoDTO> photoList = danggeunPhotoMapper.selectAllByDanggeunId(danggeunInfoDTO.getId());

		int count = 0;
		for(DanggeunPhotoDTO photo : photoList) {
			count = 0;
			for(String address : map.values()) {
				if(address.equals(photo.getAddress())) {
					count = 1;
					break;
				}
			}
			if(count == 0) {
				s3UploadService.deleteFile(photo.getAddress());
			}
		}
		danggeunPhotoMapper.deleteAll(danggeunInfoDTO.getId());
		danggeunInfoDTO.setPhoto_address(map.get(0));
		danggeunInfoMapper.update(danggeunInfoDTO);
		
	    for (Map.Entry<Integer, String> entry : map.entrySet()) {
	        Integer index = entry.getKey();
	        String address = entry.getValue();
	        danggeunPhotoMapper.insert(new DanggeunPhotoDTO(address, danggeunInfoDTO.getId(), index));

		}

	}

	//사진 추가하는거 넣어야 될듯?
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void registerDanggeun(DanggeunInfoDTO danggeunInfoDTO, List<String> list) throws Exception {
		danggeunInfoDTO.setType_name(danggeunTypeMapper.select(danggeunInfoDTO.getType_id()).getName());
		danggeunInfoDTO.setSido_name(addressSidoMapper.select(danggeunInfoDTO.getSido_code()).getName());
		danggeunInfoDTO.setSigoon_name(addressSigoonMapper.select(danggeunInfoDTO.getSigoon_code()).getName());
		danggeunInfoDTO.setDong_name(addressDongMapper.select(danggeunInfoDTO.getDong_code()).getName());
		danggeunInfoDTO.setPhoto_address(list.get(0));
		danggeunInfoMapper.insert(danggeunInfoDTO);
		
		int i = 0;
		for(String address : list) {
			danggeunPhotoMapper.insert(new DanggeunPhotoDTO(address, danggeunInfoDTO.getId(), i));
			i++;
		}
	}

	
	@Override
	@Transactional(rollbackFor = Exception.class)
	public void removeDanggeun(Integer id) throws Exception {
		List<DanggeunPhotoDTO> list = danggeunPhotoMapper.selectAllByDanggeunId(id);

		for(DanggeunPhotoDTO dto : list) {
			s3UploadService.deleteFile(dto.getAddress());
		}
		danggeunInfoMapper.delete(id);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void pushZzim(String user_nickname, Integer danggeun_id) throws Exception {
		danggeunZzimMapper.insert(new DanggeunZzimDTO(user_nickname, danggeun_id));
		int cnt = 1;
		Map map = new HashMap();
		map.put("id", danggeun_id);
		map.put("cnt", cnt);
		danggeunInfoMapper.updateZzimCnt(map);
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public void cancelZzim(String user_nickname, Integer danggeun_id) throws Exception {
		danggeunZzimMapper.delete(new DanggeunZzimDTO(user_nickname, danggeun_id));
		int cnt = -1;
		Map map = new HashMap();
		map.put("id", danggeun_id);
		map.put("cnt", cnt);
		danggeunInfoMapper.updateZzimCnt(map);
	}

	@Override
	public List<DanggeunTypeDTO> getTypeList() throws Exception {
		return danggeunTypeMapper.selectAll();
	}

}
