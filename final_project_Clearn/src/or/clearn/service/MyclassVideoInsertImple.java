package or.clearn.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import or.clearn.dao.MyClassDao;
import or.vo.MyClassVO;
import or.vo.RestVO;

// Ʈ����� ó���� �ϱ� ���ؼ� @Transactional������̼��� ����ϰ�,
//@Autowired�� ����ϱ� ���ؼ� @Service ������̼��� ����Ѵ�.
@Transactional
@Service
public class MyclassVideoInsertImple implements MyclassVideoInsertInter {

	// MyClassDao�� �������� �ڵ��� ���⸦ �Ѵ�.
	@Autowired
	private MyClassDao myclassDao;
	
	// ������û �� ������ ���� ������ش�.
	// Ʈ����� ó���� �Ѵ�.
	@Override
	public void insertMyclassVideo(MyClassVO mcvo, RestVO rvo) throws Exception {
		myclassDao.insertClass(mcvo);
		myclassDao.insertVideo(rvo);
	}

}
