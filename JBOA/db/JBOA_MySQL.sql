#----------------(1.0)�������ݿ�------------------
drop database if exists jboa;
create database jboa;
use jboa;

#----------------(2.0)������������------------------
create table t_claimVoucher
(
	voucherID			int auto_increment not null,		/*���������*/
	creatorID			int,								/*��˱��*/
	dealEmployeeID		int,								/*�������˱��*/
	createTime			timestamp, 							/*�����*/
	event				varchar(200),						/*����*/
	totalAccount		double,								/*�������ܽ��*/
	status				int,								/*������״̬*/
	primary key(voucherID)				
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(3.0)������������ϸ��------------------
create table t_claimVoucherItems
(
	itemID			int auto_increment not null,			/*��ϸ���*/
	voucherID		int,									/*���������*/
	typeID			int,									/*������Ŀ*/
	account			float, 									/*���*/
	content			varchar(100),							/*����˵��*/	
	primary key(itemID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(4.0)��������������------------------
create table t_itemType
(
	typeID			int auto_increment not null,			/*��ϸ���ͱ��*/
	typeName			varchar(100),							/*��ϸ��������*/	
	primary key(typeID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(5.0)������˽����------------------
create table t_checkResult
(
	checkResultID		int auto_increment not null,		/*��˽�����*/
	voucherID			int,								/*���������*/
	checkDate			timestamp,							/*�������*/
	checkEmployee		int,								/*����˱��*/
	checkResult			int, 								/*��˽��*/
	comment				varchar(200),						/*������*/
	checkType			int,								/*�������*/
	primary key(checkResultID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(6.0)�������ű�------------------
create table t_department
(
	deptID				int auto_increment not null,		/*���ű��*/
	deptName			varchar(30),						/*������*/
	deptLeader			int,								/*���ž�����*/
	primary key(deptID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;


#----------------(7.0)����Ա����------------------
create table t_employee
(
	empID			int auto_increment not null,			/*Ա�����*/
	empName			varchar(50),							/*Ա������*/
	empAccount		varchar(50),							/*�˺�*/
	empPassword		varchar(50),						/*����*/
	positionID		int, 											/*ְλ*/
	deptID			int,											/*����*/
	phone			varchar(30),								/*�绰*/
	primary key(empID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(8.0)���������ֵ��------------------
create table t_dictionary
(
	dicID			int auto_increment not null,				/*���*/
	dicType			int,										/*����(0������״̬/1ְλ/2�������/3��˽��)*/
	dicName			varchar(50),								/*����*/
	primary key(dicID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(9.0)��ʼ������------------------
insert into t_dictionary(dicType,dicname) values(0,'�½�');		/*���Բ鿴(�޸�)��ɾ�����ύ*/
insert into t_dictionary(dicType,dicname) values(0,'�����');		/*���Բ鿴(���)*/
insert into t_dictionary(dicType,dicname) values(0,'���');		/*���Բ鿴(�޸�)���ύ*/
insert into t_dictionary(dicType,dicname) values(0,'��ֹ');		/*���Բ鿴*/
insert into t_dictionary(dicType,dicname) values(0,'���');		/*���Բ鿴*/
insert into t_dictionary(dicType,dicname) values(1,'��ͨԱ��');
insert into t_dictionary(dicType,dicname) values(1,'���ž���');
insert into t_dictionary(dicType,dicname) values(1,'�ܾ���');
insert into t_dictionary(dicType,dicname) values(1,'����');
insert into t_dictionary(dicType,dicname) values(2,'���ž������');
insert into t_dictionary(dicType,dicname) values(2,'�ܾ������');
insert into t_dictionary(dicType,dicname) values(2,'�������');
insert into t_dictionary(dicType,dicname) values(3,'ͬ��');
insert into t_dictionary(dicType,dicname) values(3,'���');
insert into t_dictionary(dicType,dicname) values(3,'�ܾ�');



insert into t_itemType(typeName) values('���ڽ�ͨ');
insert into t_itemType(typeName) values('���÷�');
insert into t_itemType(typeName) values('�칫��Ʒ');
insert into t_itemType(typeName) values('Ա���');
insert into t_itemType(typeName) values('��������');



insert into t_department(deptName,deptLeader) values('������',1002);
insert into t_department(deptName,deptLeader) values('���۲�',1004);
insert into t_department(deptName,deptLeader) values('������',1012);

insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('����','joe','joe',1007,1000,'13720242055');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('����','liuk','liuk',1008,1000,'13865748936');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('����','cheny','cheny',1006,1000,'13398767654');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('��С��','hexj','hexj',1005,1000,'13678789098');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('����','zhangw','zhangw',1006,1001,'13976543676');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('��ɭ��','xiongsf','xiongsf',1005,1001,'13876754564');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('��һ��','wangyx','wangyx',1005,1001,'13965310098');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('��־ǿ','zhuzq','zhuzq',1005,1001,'13087876546');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('����','zhangl','zhangl',1005,1001,'13387876509');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('����','wangk','wangk',1005,1001,'13399998767');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('����','duw','duw',1005,1001,'13878765102');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('Ҷ��ǿ','yefq','yefq',1005,1001,'13376111123');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('���','yangj','yangj',1006,1002,'13987876756');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('���ѷ�','dingyf','dingyf',1005,1002,'15899787865');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('�ƴ���','huangcs','huangcs',1005,1002,'15876760989');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('����','caox','caox',1005,1002,'13658588897');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('������','yangzy','yangzy',1005,1002,'13567890912');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('�⺣ƽ','wuhp','wuhp',1005,1002,'15807071823');

/*�½�*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1008,current_timestamp,'���ð칫��Ʒ',100.00,1000);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1000,1000,20,'��ͨ��');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1000,1002,80,'�ʣ����ӣ��������');

/*�����-���ž���*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1004,current_timestamp,'Ԫ���������',2200.00,1001);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1001,1003,1200,'��᳡');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1001,1003,800,'Ա����Ʒ');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1001,1003,200,'�ӷ�');

/*�����-�ܾ���*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1000,current_timestamp,'��˾10�������',6500.00,1001);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1002,1003,3700,'���(ũ�Ҳ�3��)');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1002,1003,2800,'KTV(Ǯ��)');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1002,current_timestamp,1004,1012,'ͬ��,����ÿ�����80',1009);

/*�����-����*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1001,current_timestamp,'���ù���',2000.00,1001);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1003,1004,1400,'��Ա��10��ÿ��140');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1003,1004,600,'ŮԱ��5��ÿ��120');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1003,current_timestamp,1004,1012,'ͬ��',1009);

/*���*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1004,current_timestamp,'����Ǳ�ڿͻ�',3200.00,1002);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1004,1004,3200,'����ת����Ǳ�ڿͻ��ֳ��µ��ͺ���3����');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1004,current_timestamp,1004,1012,'ͬ��,��3���οͻ��൱�ڲ�׬����,�����ƹ�����',1009);
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1004,current_timestamp,1000,1013,'�ɸ�Ϊ����һ���ν�Լ�ɱ�',1010);
/*�ܾ�*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1008,current_timestamp,'Ա���칫���Է���',8800.00,1003);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1005,1002,-1200,'��ǰʹ�õ����۾ɳ���');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1005,1002,10000,'�»�5̨ÿ̨2000');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1005,current_timestamp,1004,1014,'���������쿪,����Ϊ��˾���㿪�ģ�',1009);
/*���*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1001,current_timestamp,'��������',536.00,1004);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1006,1001,200,'ס��2��');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1006,1001,300,'���ػ�Ʊ');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1006,1001,36,'Ӧ�����');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1006,current_timestamp,1004,1012,'ͬ��',1009);
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1006,current_timestamp,1001,1012,'�����������Ѹ���',1011);
commit;

#----------------(10.0)���������ϵ------------------
alter table t_claimVoucher 
	add constraint FK_creator_employee foreign key (creatorID)  references t_employee(empID);	
alter table	t_claimVoucher		
	add constraint FK_deal_employee foreign key (dealEmployeeID)  references t_employee(empID);
alter table	t_claimVoucherItems		
	add constraint FK_claimVoucherItems_claimVoucher foreign key (voucherID)  references t_claimVoucher(voucherID);
alter table	t_claimVoucherItems		
	add constraint FK_claimVoucherItems_itemType foreign key (typeID)  references t_itemType(typeID);
alter table	t_checkResult		
	add constraint FK_checkResult_claimVoucher foreign key (voucherID)  references t_claimVoucher(voucherID);
alter table	t_checkResult		
	add constraint FK_checkResult_employee foreign key (checkEmployee)  references t_employee(empID);
alter table	t_department		
	add constraint FK_department_employee foreign key (deptLeader)  references t_employee(empID);
alter table	t_employee		
	add constraint FK_employee_department foreign key (deptID)  references t_department(deptID);

