package or.clearn.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.vo.SearchNoticeVO;

@Repository
public class NoticeDao {
	@Autowired
	private SqlSessionTemplate ss;

	// �������� ���
	public void noticeAdd(SearchNoticeVO snvo) {
		ss.insert("notice.noticeAdd", snvo);
	}

	// �������� ������ ���
	public List<SearchNoticeVO> noticeListFix() {
		return ss.selectList("notice.noticeListFix");
	}

	// �������� ��� ���
	public List<SearchNoticeVO> noticeList(SearchNoticeVO snvo) {
		return ss.selectList("notice.noticeList", snvo);
	}

	// �������� ��� ��� ī��Ʈ
	public int noticeListTotal() {
		return ss.selectOne("notice.noticeListTotal");
	}

	// �������� ��� ��� �˻�
	public List<SearchNoticeVO> noticeListSearch(SearchNoticeVO snvo) {
		// System.out.println("�˻�Ÿ��3:"+snvo.getSearchType());
		// System.out.println("�˻�value3:"+snvo.getSearchValue());
		System.out.println("start1:" + snvo.getStart());
		System.out.println("end1:" + snvo.getEnd());
		return ss.selectList("notice.noticeListSearch", snvo);
	}
	// �������� ��� ��� �˻� ī��Ʈ
	public int noticeListSearchTotal(SearchNoticeVO snvo){
		return ss.selectOne("notice.noticeListSearchTotal",snvo);
	}
	// �������� ��������
	public SearchNoticeVO noticeDetail(int n_num){
		return ss.selectOne("notice.noticeDetail", n_num);
	}
	// �������� ��ȸ�� ����
	public void noticeUpdateHit(int n_num){
		ss.update("notice.noticeUpdateHit", n_num);
	}
	// �������� ����
	public void noticeUpdate(SearchNoticeVO snvo){
		ss.update("notice.noticeUpdate",snvo);
	}
	// �������� ����
	public void noticeDelete(int n_num){
		ss.delete("notice.noticeDelete",n_num);
	}
}
