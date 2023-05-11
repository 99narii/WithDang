package com.earth.model;

public class PageResolver {
	
	private SearchItem sc;		//검색 클래스 하나 생성
	
	private int totalCnt;		//게시물 총 갯수
	private int pageSize;		//한 페이지 당 게시물 갯수
	private final int NAV_SIZE=10;	//페이지 내비게이션 사이즈 상수로 정의
	
	private int totalPage;		//전체 페이지 갯수
	private int page;			//현재 페이지
	
	private int beginPage;		//내비게이션 첫 페이지 숫자
	private int endPage;		//내비게이션 마지막 페이지 숫자
	private boolean showNext = false;	//다음페이지로 이동하는 링크를 보여줄지 여부 (endPage==totoalPage이면 showNext는 false)
	private boolean showPrev = false;	//이전페이지로 이동하는 링크를 보여줄지 여부 (beginPage==1이 아니면 showPrev는 true)
	
	public PageResolver(int totalCnt, Integer page) {
		this(totalCnt, new SearchItem(page, 10));
	}
	
	public PageResolver(int totalCnt, Integer page, Integer pageSize) {
		this(totalCnt, new SearchItem(page, pageSize));
	}
	
	public PageResolver(int totalCnt, SearchItem sc) {
		this.totalCnt = totalCnt;
		this.sc = sc;
		
		doPaging(totalCnt, sc);			//전체 게시물에서 검색을 받아 페이징 처리를 하기위해 생성자 생성
		
	}
	
	private void doPaging(int totalCnt, SearchItem sc) {
		this.totalPage = totalCnt / sc.getPageSize() +  (totalCnt % sc.getPageSize() == 0 ? 0 : 1);		// 전체 페이지 개수
		this.sc.setPage(Math.min(sc.getPage(), totalPage));		// page가 totalPage보다 크지 않음
		
		//현재 페이지(page)를 네비게이션 크기(nav_size)로 나누고,
		//다시 네비게이션 크기를 곱해서 1의 자리수를 0으로 만들고 1을 더함 
		this.beginPage = (this.sc.getPage()-1) / NAV_SIZE * NAV_SIZE + 1;
		
		// 네비게이션의 마지막 페이지 숫자
		// beginPage에 네비게이션 크기(nav_size)를 더하고 1을 뺀 값과
		// 총 페이지수 (totalPage) 중에 적은 것
		this.endPage = Math.min(this.beginPage + this.NAV_SIZE - 1, totalPage);
		
		// beginPage가 1 아니면 true로 함 (< 기호가 보임)
		this.showPrev = beginPage != 1;
		
		// endPage가 totalPage가 아니면 true로 함 (> 기호가 보임
		this.showNext = endPage != totalPage;		
	}
	
	public void print() {
		System.out.println("page = " + sc.getPage());
		System.out.print(showPrev ? "PRE " : "");
		
		for(int i=beginPage; i<=endPage; i++) {
			System.out.print(i + " ");
		}
				
		System.out.println(showNext ? " NEXT" : "");		
		
	}

	@Override
	public String toString() {
		return "PageResolver [sc=" + sc + ", totalCnt=" + totalCnt + ", pageSize=" + pageSize + ", NAV_SIZE=" + NAV_SIZE
				+ ", totalPage=" + totalPage + ", page=" + page + ", beginPage=" + beginPage + ", endPage=" + endPage
				+ ", showNext=" + showNext + ", showPrev=" + showPrev + "]";
	}

	public SearchItem getSc() {
		return sc;
	}

	public void setSc(SearchItem sc) {
		this.sc = sc;
	}

	public int getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(int totalCnt) {
		this.totalCnt = totalCnt;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getBeginPage() {
		return beginPage;
	}

	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public boolean isShowNext() {
		return showNext;
	}

	public void setShowNext(boolean showNext) {
		this.showNext = showNext;
	}

	public boolean isShowPrev() {
		return showPrev;
	}

	public void setShowPrev(boolean showPrev) {
		this.showPrev = showPrev;
	}

	public int getNAV_SIZE() {
		return NAV_SIZE;
	}
	
	
}