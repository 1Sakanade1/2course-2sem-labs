use master
go

create database MSV_MyBase_3Lab_5z
    on primary
    (name = N'MSV_MyBase_3Lab_5z_mdf', filename = N'D:\code\labs\sql\3lab_5z\MSV_MyBase_3Lab_5z_mdf.mdf',
        size = 10240 Kb, maxsize = UNLIMITED, filegrowth =1024 Kb),
		
    ( name = N'MSV_MyBase_3Lab_5z_ndf', filename = N'D:\code\labs\sql\3lab_5z\MSV_MyBase_3Lab_5z_ndf.ndf',
        size = 10240 KB, maxsize =1 Gb, filegrowth =25%),

    filegroup FG1

        ( name = N'MSV_MyBase_3Lab_5z_1', filename = N'D:\code\labs\sql\3lab_5z\MSV_MyBase_3Lab_5z__fgq-1.ndf',
            size = 10240 Kb, maxsize =1 Gb, filegrowth =25%),
        ( name = N'MSV_MyBase_3Lab_5z_2', filename = N'D:\code\labs\sql\3lab_5z\MSV_MyBase_3Lab_5z_fgq-2.ndf',
            size = 10240 Kb, maxsize =1 Gb, filegrowth =25%)
    log on
    (name = N'MSV_MyBase_3Lab_5z', filename = N'D:\code\labs\sql\3lab_5z\MSV_MyBase_3Lab_5z_log.ldf',
        size = 10240 Kb, maxsize =2048 Gb, filegrowth =10%)