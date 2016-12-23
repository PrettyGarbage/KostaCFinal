package or.clearn.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.vo.SearchFaqBoardVO;

@Repository
public class FaqBoardDao {
	@Autowired
	private SqlSessionTemplate ss;
	// �����ϴ� ���� �Խ��� ��� 
	public List<SearchFaqBoardVO> faqboardList(){
		return ss.selectList("faqboard.faqboardList");
	}
}
