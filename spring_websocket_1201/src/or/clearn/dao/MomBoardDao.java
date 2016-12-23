package or.clearn.dao;

import java.util.List;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import or.vo.MomBoardVo;
import or.vo.ReplyVo;

@Repository
public class MomBoardDao { 
	@Autowired
	private SqlSessionTemplate ss;

	// �� �Խ��� ���
	public void insertMomBoard(MomBoardVo mvo) {
		ss.insert("momBoard.momBoardAdd", mvo);
	}

	// �� �Խ��� ����Ʈ
	public List<MomBoardVo> listMomBoard1(MomBoardVo mvo) {
		return ss.selectList("momBoard.momBoardList2", mvo);
	}

	// �� �Խ��� ��� ��� �˻� ī��Ʈ
	public int totalMomboard1() {
		return ss.selectOne("momBoard.momBoardTotal"); // ?
	}

	// �� �Խ��� ��� ��� �˻�

	public List<MomBoardVo> listMomBoard2(MomBoardVo mvo) {
		System.out.println("�˻�Ÿ��1:" + mvo.getSearchType());
		System.out.println("�˻�value1:" + mvo.getSearchValue());
		return ss.selectList("momBoard.momBoardListSearch", mvo);
	}

	// �� �Խ��� ����Ʈ ����(�˻�) 
	public int totalMomboard2(MomBoardVo mvo) {
		System.out.println("�˻�Ÿ��2:" + mvo.getSearchType());
		System.out.println("�˻�value2:" + mvo.getSearchValue());

		return ss.selectOne("momBoard.momBoardTotalSearch", mvo);
	}

	public List<ReplyVo> getreplyList(int ib_num) {
		return ss.selectList("reply.list", ib_num);
	}

	// �� �Խ��� ��������
	public MomBoardVo momBoardDetail(int ib_num) {
		return ss.selectOne("momBoard.momBoardDetail", ib_num);
	}

	// �� �Խ��� ��ȸ�� ����
	public void momBoardUpdateHit(int ib_num) {
		ss.update("momBoard.momBoardUpdateHit", ib_num);
	}

	// �� �Խ��� ����
	public void momBoardUpdate(MomBoardVo mvo) {
		ss.update("momBoard.momBoardUpdate", mvo);
	}

	// �� �Խ��� ����
	public void momBoardDelete(int ib_num) {
		ss.delete("momBoard.momBoardDelete", ib_num);
	}
	
	// �� �Խ��� ��� ����
	public void momBoardCommDelete(int ib_num){
		ss.delete("momBoard.momBoardCommDelete",ib_num);
	}
}
