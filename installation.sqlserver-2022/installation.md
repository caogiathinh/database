[[DATABASE - SQL]]

## DATABASE LÀ GÌ
- "Trứng rán cần mỡ, app cần database"
- Data + base: cái nền của dữ liệu.
## TÀI LIỆU & CÁCH HỌC
https://github.com/doit-now/database-craftsman

## CÀI ĐẶT DATABASE DẠNG CUSTOM 

### DOWLOAD SQL SERVER
SQL Server Dowload: https://www.microsoft.com/en-us/sql-server/sql-server-downloads
![[SQLServer.Express.01.png]]

![[SQLServer.Express.02.png]]

![[SQLServer.Express.03.png]]

![[SQLServer.Express.04.png]]

![[SQLServer.Express.05.png]]
![[SQLServer.Express.06 1.png]]

![[SQLServer.Installation.01.png]]

![[SQLServer.Installation.02.png]]

![[SQLServer.Installation.03.png]]

![[SQLServer.Installation.04.png]]

![[SQLServer.Installation.05.png]]

![[SQLServer.Installation.06.png]]

![[SQLServer.Installation.07.png]]

![[SQLServer.Installation.08.png]]

![[SQLServer.Installation.09.png]]

![[SQLServer.Installation.10.png]]

#### Cách xem hệ thống server đang hoạt động: 
Window + R -> services.msc

#### Điểm áp dụng tư duy hướng đối tượng trong Database
```java
public class Student {
	private String id;
	private String name;
	private int yob;
	private double gpa;
	
	public Student(String id, String name, int yob, double gpa) {
		this.id = id; 
		this.name = name; 
		this.yob = yob; 
		this.gpa = gpa; 
	}
	
	//getter, setter
	//....
}

```

Student                   an        =                 new Student("SE123456", "AN NGUYEN", 2003, 9.0); 
class/mold         biến object,                                    object/instance
data type                reference var                             thể hiện/hiện thân/phiên bản/đối tượng
object data type

Student                                 binh             =                   new Student(..............); 
C:\Program Files/.....
					sqlsrv.exe                     -> đi vào RAM chờ ai đó yêu cầu xử lí data
									   -> INSTANCE là server nằm trong ram/đoạn code binary và được đặt 1 cái tên.
C:\Program Files\Microsoft SQL Server\MSSQL16.THINH\MSSQL\Binn								

Window có 1 Data nội bộ (đạng cây phân cấp) quản lí thông số máy, các app cài vào -> REGISTRY
	![[registry.png]]
### DOWLOAD SSMS (client tool)
https://learn.microsoft.com/en-us/ssms/install/install

![[SSMS.Installation.01.png]]

![[SSMS.Installation.02.png]]

![[SSMS.Installation.03.png]]

![[SSMS.Installation.04.png]]

![[SSMS.Installation.05.png]]

![[SSMS.Installation.06.png]]

