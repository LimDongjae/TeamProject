package org.zerock.util;

public class PagingUtil {
	private int startCount;
	private int endCount;
	private StringBuffer pagingHtml;

	public PagingUtil(int currentPage, int totalCount, int rowCount, int pageCount, String pageUrl) {
		this(null, null, currentPage, totalCount, rowCount, pageCount, pageUrl, null);
	}

	public PagingUtil(int currentPage, int totalCount, int rowCount, int pageCount, String pageUrl, String addKey) {
		this(null, null, currentPage, totalCount, rowCount, pageCount, pageUrl, addKey);
	}

	public PagingUtil(String keyfield, String keyword, int currentPage, int totalCount, int rowCount, int pageCount,
			String pageUrl) {
		this(keyfield, keyword, currentPage, totalCount, rowCount, pageCount, pageUrl, null);
	}

	public PagingUtil(String keyfield, String keyword, int currentPage, int totalCount, int rowCount, int pageCount,
			String pageUrl, String addKey) {

		if (addKey == null)
			addKey = "";

		int totalPage = (int) Math.ceil((double) totalCount / rowCount);
		if (totalPage == 0) {
			totalPage = 1;
		}

		if (currentPage > totalPage) {
			currentPage = totalPage;
		}

		startCount = (currentPage - 1) * rowCount + 1;
		endCount = currentPage * rowCount;

		int startPage = (int) ((currentPage - 1) / pageCount) * pageCount + 1;
		int endPage = startPage + pageCount - 1;

		if (endPage > totalPage) {
			endPage = totalPage;
		}

		pagingHtml = new StringBuffer();
		if (currentPage > pageCount) {
			pagingHtml.append("<li class='paginate_button previous'>");
			if (keyword == null) {
				pagingHtml.append("<a href=" + pageUrl + "?pageNum=" + (startPage - 1) + addKey + ">");
			} else {
				pagingHtml.append("<a href=" + pageUrl + "?keyfield=" + keyfield + "&keyword=" + keyword + "&pageNum="
						+ (startPage - 1) + addKey + ">");
			}
			pagingHtml.append("이전");
			pagingHtml.append("</a>");
			pagingHtml.append("</li>");
		}
		//pagingHtml.append("&nbsp;|&nbsp;");

		for (int i = startPage; i <= endPage; i++) {
			if (i > totalPage) {
				break;
			}
			if (i == currentPage) {
				pagingHtml.append("<li class='paginate_button active'>");
				pagingHtml.append("&nbsp;<a href='" + pageUrl + "?pageNum=");
				pagingHtml.append(i);
				pagingHtml.append(addKey + "'>");
				//pagingHtml.append("<font color='red'>");
				pagingHtml.append(i);
				//pagingHtml.append("</font></a>");
				pagingHtml.append("</a>");				
			} else {
				pagingHtml.append("<li class='paginate_button'>");
				if (keyword == null) {
					pagingHtml.append("&nbsp;<a href='" + pageUrl + "?pageNum=");
				} else {
					pagingHtml.append("&nbsp;<a href='" + pageUrl + "?keyfield=" + keyfield + "&keyword=" + keyword
							+ "&pageNum=");
				}
				pagingHtml.append(i);
				pagingHtml.append(addKey + "'>");
				pagingHtml.append(i);
				pagingHtml.append("</a>");
				pagingHtml.append("</li>");
			}
			//pagingHtml.append("&nbsp;");
		}
		//pagingHtml.append("&nbsp;&nbsp;|&nbsp;&nbsp;");

		if (totalPage - startPage >= pageCount) {
			pagingHtml.append("<li class='paginate_button next'>");
			if (keyword == null) {
				pagingHtml.append("<a href=" + pageUrl + "?pageNum=" + (endPage + 1) + addKey + ">");
			} else {
				pagingHtml.append("<a href=" + pageUrl + "?keyfield=" + keyfield + "&keyword=" + keyword + "&pageNum="
						+ (endPage + 1) + addKey + ">");
			}
			pagingHtml.append("다음");
			pagingHtml.append("</a>");
			pagingHtml.append("</li>");
		}
	}

	public StringBuffer getPagingHtml() {
		return pagingHtml;
	}

	public int getStartCount() {
		return startCount;
	}

	public int getEndCount() {
		return endCount;
	}

}
