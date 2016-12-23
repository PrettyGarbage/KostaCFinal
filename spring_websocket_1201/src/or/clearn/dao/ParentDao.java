package or.clearn.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.vo.ParentVO;
import or.vo.SearchParentVO;

@Repository
public class ParentDao {
	@Autowired
	private SqlSessionTemplate ss;

	public void addParent(ParentVO vo) {
		ss.insert("parent.add", vo);
	}

	public int checkId(String p_id) {
		return ss.selectOne("parent.check", p_id);
	}

	public int checknickname(String p_nickname) {
		return ss.selectOne("parent.nickname", p_nickname);
	}

	public ParentVO parentdetail(int p_num) {
		return ss.selectOne("parent.parentdetail", p_num);
	}
	public void parentupdate(ParentVO vo){
		ss.update("parent.parentupdate", vo);
	}

	public String getdeletefile(int p_num) {
		return ss.selectOne("parent.getdeletefile", p_num);
	}
	public List<SearchParentVO> parentlist(SearchParentVO spvo) {
		return ss.selectList("parent.parentlist", spvo);
	}
	// �θ��� ��� ����� �� ��
	public int parentlisttotal() {
		return ss.selectOne("parent.parentlisttotal");
	}
	// �θ��� ��� ��� �˻�
	public List<SearchParentVO> parentlistsearch(SearchParentVO spvo) {
		return ss.selectList("parent.parentlistsearch", spvo);
	}
	// �θ��� ��� ����� �� �� �˻�
	public int parentlisttotalsearch(SearchParentVO spvo){
		return ss.selectOne("parent.parentlisttotalsearch",spvo);
	}
	// �θ��� ��������
	public SearchParentVO parentdetailadmin(int p_num){
		return ss.selectOne("parent.parentdetailadmin", p_num);
	}
}
