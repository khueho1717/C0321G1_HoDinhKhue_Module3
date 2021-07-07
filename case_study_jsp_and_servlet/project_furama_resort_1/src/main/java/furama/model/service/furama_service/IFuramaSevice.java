package furama.model.service.furama_service;

import java.sql.SQLException;
import java.util.List;

public interface IFuramaSevice<E> {

    public void insertData(E e) throws SQLException;

    public E selectData(int id);

    public List<E> selectAllData();

    public void deleteData(int id) throws SQLException;

    public void updateData(E e) throws SQLException;
}
