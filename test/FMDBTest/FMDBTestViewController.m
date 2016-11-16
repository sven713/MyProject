//
//  FMDBTestViewController.m
//  test
//
//  Created by sven on 16/11/16.
//  Copyright © 2016年 sven. All rights reserved.
//

#import "FMDBTestViewController.h"
#import "FMDB.h"

@interface FMDBTestViewController ()
@property (nonatomic, copy) NSString *dbPath;
@end

@implementation FMDBTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

- (void)configUI {
    self.title = @"FMDB测试";
    self.view.backgroundColor = [UIColor darkGrayColor];
    
    NSString* docsdir = [NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    NSString* dbpath = [docsdir stringByAppendingPathComponent:@"user.sqlite"];
    self.dbPath = dbpath;
    
    UIButton *createBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 50, 100, 50)];
    [self.view addSubview:createBtn];
    createBtn.backgroundColor = [UIColor orangeColor];
    [createBtn addTarget:self action:@selector(createDB) forControlEvents:UIControlEventTouchUpInside];
    [createBtn setTitle:@"创建表格" forState:UIControlStateNormal];

    UIButton *addBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 100, 100, 50)];
    [self.view addSubview:addBtn];
    addBtn.backgroundColor = [UIColor orangeColor];
    [addBtn addTarget:self action:@selector(addData) forControlEvents:UIControlEventTouchUpInside];
    [addBtn setTitle:@"添加项目" forState:UIControlStateNormal];
    
    UIButton *searchBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 150, 100, 50)];
    [self.view addSubview:searchBtn];
    searchBtn.backgroundColor = [UIColor orangeColor];
    [searchBtn addTarget:self action:@selector(searchData) forControlEvents:UIControlEventTouchUpInside];
    [searchBtn setTitle:@"查找项目" forState:UIControlStateNormal];
    
    UIButton *clearBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 200, 100, 50)];
    [self.view addSubview:clearBtn];
    clearBtn.backgroundColor = [UIColor orangeColor];
    [clearBtn addTarget:self action:@selector(clearData) forControlEvents:UIControlEventTouchUpInside];
    [clearBtn setTitle:@"全部清除" forState:UIControlStateNormal];
    
    UIButton *mutipleInsertBtn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 50)];
    [self.view addSubview:mutipleInsertBtn];
    mutipleInsertBtn.backgroundColor = [UIColor orangeColor];
    [mutipleInsertBtn addTarget:self action:@selector(mutipleThreadInsert) forControlEvents:UIControlEventTouchUpInside];
    [mutipleInsertBtn setTitle:@"多线程插入大量数据" forState:UIControlStateNormal];
}

/**创建表格*/
- (void)createDB {
    
    NSFileManager *fileManager = [[NSFileManager alloc]init];
    if ([fileManager fileExistsAtPath:self.dbPath]) {
        NSLog(@"这个路径下面有文件啦,不会再创建这个名字的文件");
        return;
    }
    
    FMDatabase* db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) { // 打开数据库
        NSString * sql = @"CREATE TABLE 'User' ('id' INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL , 'name' VARCHAR(30), 'password' VARCHAR(30))"; // 创建表格的sq语句
        BOOL res = [db executeUpdate:sql];
        if (!res) {
            NSLog(@"创建表格失败");
        }else {
            NSLog(@"创建表格成功");
        }
        [db close];
    }else {
        NSLog(@"创建数据库失败");
    }
}

/**插入数据*/
- (void)addData {
    static int idx = 1; // static??? 延迟局部变量的生命周期
    FMDatabase * db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        NSString * sql = @"insert into user (name, password) values(?, ?) "; // 插入 sql语句
        NSString * name = [NSString stringWithFormat:@"songximing%d", idx++];
        BOOL res = [db executeUpdate:sql, name, @"boy"];
        if (!res) {
            NSLog(@"插入数据失败  insert data");
        } else {
            NSLog(@"插入数据成功  succ to insert data");
        }
        [db close];
    }
}

/**查找数据*/
- (void)searchData {
    FMDatabase * db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        NSString * sql = @"select * from user"; // 查找
        FMResultSet * rs = [db executeQuery:sql];
        while ([rs next]) {
            int userId = [rs intForColumn:@"id"];
            NSString * name = [rs stringForColumn:@"name"];
            NSString * pass = [rs stringForColumn:@"password"];
            NSLog(@"user id = %d, name = %@, pass = %@", userId, name, pass);
        }
        [db close];
    }
}

/**清除数据*/
- (void)clearData {
    FMDatabase * db = [FMDatabase databaseWithPath:self.dbPath];
    if ([db open]) {
        NSString * sql = @"delete from user";
        BOOL res = [db executeUpdate:sql];
        if (!res) {
            NSLog(@"删除失败 error to delete db data");
        } else {
            NSLog(@"成功删除所有数据 succ to deleta db data");
        }
        [db close];
    }
}

- (void)mutipleThreadInsert {
    FMDatabaseQueue * queue = [FMDatabaseQueue databaseQueueWithPath:self.dbPath];
    dispatch_queue_t q1 = dispatch_queue_create("queue1", NULL);
    dispatch_queue_t q2 = dispatch_queue_create("queue2", NULL);
    
    dispatch_async(q1, ^{
        for (int i = 0; i < 50; ++i) {
            [queue inDatabase:^(FMDatabase *db) {
                NSString * sql = @"insert into user (name, password) values(?, ?) ";
                NSString * name = [NSString stringWithFormat:@"queue111 %d", i];
                BOOL res = [db executeUpdate:sql, name, @"boy"];
                if (!res) {
                    NSLog(@"error to add db data: %@", name);
                } else {
                    NSLog(@"succ to add db data: %@", name);
                }
            }];
        }
    });
    
    dispatch_async(q2, ^{
        for (int i = 0; i < 100; ++i) {
            [queue inDatabase:^(FMDatabase *db) {
                NSString * sql = @"insert into user (name, password) values(?, ?) ";
                NSString * name = [NSString stringWithFormat:@"queue222 %d", i];
                BOOL res = [db executeUpdate:sql, name, @"boy"];
                if (!res) {
                    NSLog(@"error to add db data: %@", name);
                } else {
                    NSLog(@"succ to add db data: %@", name);
                }
            }];
        }
    });
}

@end
