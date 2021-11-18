//
//  DBHelper.swift
//  College System
//
//  Created by Mac on 14/10/21.
//

import Foundation
import SQLite3

class DBHelper{
    var db: OpaquePointer?
    init(){
        db = createAndOpen()
    }
    private func createAndOpen() ->OpaquePointer? {
        let databaseName = "college.sqlite"
        var db : OpaquePointer?
        
        do{
            let documentDir = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false).appendingPathComponent(databaseName)
            
            if sqlite3_open(documentDir.path, &db) == SQLITE_OK{
                print("Database opened successfully... ")
                print("database path\(documentDir.path)")
                return db
            }else{
                print("unable to open database")
            }
            
        } catch {
            print("unable to get directory\(error.localizedDescription)")
        }
        return nil
    }// createAndOPen
    
    func createCollegeTable(){
        var createTableStatement: OpaquePointer?
        let createTableQuery = "CREATE TABLE IF NOT EXISTS College(rno INTEGER PRIMARY KEY,name TEXT,classname TEXT,deptname TEXT)"
        
        if sqlite3_prepare(db, createTableQuery, -1, &createTableStatement, nil) == SQLITE_OK {
            if sqlite3_step(createTableStatement) == SQLITE_DONE{
            print("college table successfully created.....")
            }else{
                print("Unable to create college table!!!!")
            }
        }else{
            print("Unable to prepare create table statement!!")
        }
}//createclgtable function end
    
    func insertValuesInCollege(rno: Int,name : String,Classname: String,Deptname: String )
{
        var insertStatement: OpaquePointer?
        let insertQuery = "INSERT INTO College(rno,name,Classname,Deptname) VALUES(?,?,?,?)"
        if sqlite3_prepare_v2(db, insertQuery, -1, &insertStatement, nil) == SQLITE_OK{
            let rno = Int32(rno)
            sqlite3_bind_int(insertStatement, 1, rno)
            let name = name as NSString
            let nameText = name.utf8String
            sqlite3_bind_text(insertStatement, 2, nameText, -1, nil)
            let classname = Classname as NSString
            let classnameText = classname.utf8String
            sqlite3_bind_text(insertStatement, 3, classnameText, -1, nil)
            let deptname = Deptname as NSString
            let deptnameText = deptname.utf8String
            sqlite3_bind_text(insertStatement, 4, deptnameText, -1, nil)
            if sqlite3_step(insertStatement) == SQLITE_DONE{
                print("values inserted successfully in college table...")
            }else{
                print("unable to insert values in table")
            }
        }else{
            print("unable to prepare insert query")
        }
        sqlite3_finalize(insertStatement)
    }
    func display()  {
        var selectStatement : OpaquePointer?
        var selectQuery = "SELECT * FROM College"
        if sqlite3_prepare_v2(db, selectQuery, -1, &selectStatement, nil) == SQLITE_OK{
            while sqlite3_step(selectStatement) == SQLITE_ROW{
                let rno = sqlite3_column_int(selectStatement, 0)
                let name = String(describing: String(cString: sqlite3_column_text(selectStatement, 1)))
                let Classname = String(describing: String(cString: sqlite3_column_text(selectStatement, 2)))
                let Deptname = String(describing: String(cString: sqlite3_column_text(selectStatement, 3)))
                print("details")
            print("\(rno),\(name),\(Classname),\(Deptname)")
                
            }
        }
        else{
            print("unable to display")
        }
        sqlite3_finalize(selectStatement)
    }
}
