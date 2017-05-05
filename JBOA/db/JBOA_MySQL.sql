#----------------(1.0)创建数据库------------------
drop database if exists jboa;
create database jboa;
use jboa;

#----------------(2.0)创建报销单表------------------
create table t_claimVoucher
(
	voucherID			int auto_increment not null,		/*报销单编号*/
	creatorID			int,								/*填报人编号*/
	dealEmployeeID		int,								/*待处理人编号*/
	createTime			timestamp, 							/*填报日期*/
	event				varchar(200),						/*事由*/
	totalAccount		double,								/*报销单总金额*/
	status				int,								/*报销单状态*/
	primary key(voucherID)				
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(3.0)创建报销单明细表------------------
create table t_claimVoucherItems
(
	itemID			int auto_increment not null,			/*明细编号*/
	voucherID		int,									/*报销单编号*/
	typeID			int,									/*报销项目*/
	account			float, 									/*金额*/
	content			varchar(100),							/*费用说明*/	
	primary key(itemID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(4.0)创建报销项类型------------------
create table t_itemType
(
	typeID			int auto_increment not null,			/*明细类型编号*/
	typeName			varchar(100),							/*明细类型名称*/	
	primary key(typeID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(5.0)创建审核结果表------------------
create table t_checkResult
(
	checkResultID		int auto_increment not null,		/*审核结果编号*/
	voucherID			int,								/*报销单编号*/
	checkDate			timestamp,							/*审核日期*/
	checkEmployee		int,								/*审核人编号*/
	checkResult			int, 								/*审核结果*/
	comment				varchar(200),						/*审核意见*/
	checkType			int,								/*审核类型*/
	primary key(checkResultID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(6.0)创建部门表------------------
create table t_department
(
	deptID				int auto_increment not null,		/*部门编号*/
	deptName			varchar(30),						/*部门名*/
	deptLeader			int,								/*部门经理编号*/
	primary key(deptID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;


#----------------(7.0)创建员工表------------------
create table t_employee
(
	empID			int auto_increment not null,			/*员工编号*/
	empName			varchar(50),							/*员工名称*/
	empAccount		varchar(50),							/*账号*/
	empPassword		varchar(50),						/*密码*/
	positionID		int, 											/*职位*/
	deptID			int,											/*部门*/
	phone			varchar(30),								/*电话*/
	primary key(empID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(8.0)创建数据字典表------------------
create table t_dictionary
(
	dicID			int auto_increment not null,				/*编号*/
	dicType			int,										/*类型(0报销单状态/1职位/2审核类型/3审核结果)*/
	dicName			varchar(50),								/*名称*/
	primary key(dicID)
)
ENGINE = InnoDB,
DEFAULT CHARACTER SET = gbk,
AUTO_INCREMENT = 1000;

#----------------(9.0)初始化数据------------------
insert into t_dictionary(dicType,dicname) values(0,'新建');		/*可以查看(修改)、删除、提交*/
insert into t_dictionary(dicType,dicname) values(0,'待审核');		/*可以查看(审核)*/
insert into t_dictionary(dicType,dicname) values(0,'打回');		/*可以查看(修改)、提交*/
insert into t_dictionary(dicType,dicname) values(0,'终止');		/*可以查看*/
insert into t_dictionary(dicType,dicname) values(0,'完成');		/*可以查看*/
insert into t_dictionary(dicType,dicname) values(1,'普通员工');
insert into t_dictionary(dicType,dicname) values(1,'部门经理');
insert into t_dictionary(dicType,dicname) values(1,'总经理');
insert into t_dictionary(dicType,dicname) values(1,'财务');
insert into t_dictionary(dicType,dicname) values(2,'部门经理审核');
insert into t_dictionary(dicType,dicname) values(2,'总经理审核');
insert into t_dictionary(dicType,dicname) values(2,'财务审核');
insert into t_dictionary(dicType,dicname) values(3,'同意');
insert into t_dictionary(dicType,dicname) values(3,'打回');
insert into t_dictionary(dicType,dicname) values(3,'拒绝');



insert into t_itemType(typeName) values('市内交通');
insert into t_itemType(typeName) values('差旅费');
insert into t_itemType(typeName) values('办公用品');
insert into t_itemType(typeName) values('员工活动');
insert into t_itemType(typeName) values('其他补贴');



insert into t_department(deptName,deptLeader) values('行政部',1002);
insert into t_department(deptName,deptLeader) values('销售部',1004);
insert into t_department(deptName,deptLeader) values('生产部',1012);

insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('柳明','joe','joe',1007,1000,'13720242055');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('刘凯','liuk','liuk',1008,1000,'13865748936');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('陈寅','cheny','cheny',1006,1000,'13398767654');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('贺小俊','hexj','hexj',1005,1000,'13678789098');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('张卫','zhangw','zhangw',1006,1001,'13976543676');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('熊森峰','xiongsf','xiongsf',1005,1001,'13876754564');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('王一雄','wangyx','wangyx',1005,1001,'13965310098');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('朱志强','zhuzq','zhuzq',1005,1001,'13087876546');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('张立','zhangl','zhangl',1005,1001,'13387876509');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('王坤','wangk','wangk',1005,1001,'13399998767');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('杜伍','duw','duw',1005,1001,'13878765102');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('叶发强','yefq','yefq',1005,1001,'13376111123');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('杨捷','yangj','yangj',1006,1002,'13987876756');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('丁友峰','dingyf','dingyf',1005,1002,'15899787865');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('黄春生','huangcs','huangcs',1005,1002,'15876760989');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('操翔','caox','caox',1005,1002,'13658588897');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('杨忠义','yangzy','yangzy',1005,1002,'13567890912');
insert into t_employee(empName,empAccount,empPassword,positionID,deptID,phone) values('吴海平','wuhp','wuhp',1005,1002,'15807071823');

/*新建*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1008,current_timestamp,'购置办公用品',100.00,1000);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1000,1000,20,'交通费');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1000,1002,80,'笔，本子，回形针等');

/*待审核-部门经理*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1004,current_timestamp,'元旦联欢晚会',2200.00,1001);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1001,1003,1200,'租会场');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1001,1003,800,'员工奖品');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1001,1003,200,'杂费');

/*待审核-总经理*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1000,current_timestamp,'公司10周年庆典活动',6500.00,1001);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1002,1003,3700,'晚餐(农家菜3桌)');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1002,1003,2800,'KTV(钱柜)');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1002,current_timestamp,1004,1012,'同意,家属每人另加80',1009);

/*待审核-财务*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1001,current_timestamp,'购置工服',2000.00,1001);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1003,1004,1400,'男员工10人每套140');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1003,1004,600,'女员工5人每套120');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1003,current_timestamp,1004,1012,'同意',1009);

/*打回*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1004,current_timestamp,'开发潜在客户',3200.00,1002);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1004,1004,3200,'邀请转介绍潜在客户现场下单送海南3日游');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1004,current_timestamp,1004,1012,'同意,送3日游客户相当于不赚不赔,可起到推广作用',1009);
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1004,current_timestamp,1000,1013,'可改为东湖一日游节约成本',1010);
/*拒绝*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1008,current_timestamp,'员工办公电脑翻新',8800.00,1003);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1005,1002,-1200,'当前使用电脑折旧出售');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1005,1002,10000,'新机5台每台2000');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1005,current_timestamp,1004,1014,'真是异想天开,你以为公司是你开的？',1009);
/*完成*/
insert into t_claimVoucher(creatorID,dealEmployeeID,createTime,event,totalAccount,status)
values(1008,1001,current_timestamp,'北京出差',536.00,1004);
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1006,1001,200,'住宿2天');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1006,1001,300,'来回火车票');
insert into t_claimVoucherItems(voucherID,typeID,account,content) values(1006,1001,36,'应酬费用');
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1006,current_timestamp,1004,1012,'同意',1009);
insert into t_checkResult(voucherID,checkDate,checkEmployee,checkResult,comment,checkType)
values(1006,current_timestamp,1001,1012,'单据正常，已付款',1011);
commit;

#----------------(10.0)配置外键关系------------------
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

