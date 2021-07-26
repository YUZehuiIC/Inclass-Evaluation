import xlrd
import numpy as np
#import importlib
#importlib.reload(sys) #reload using error

def open_excel(sheet_num):
    try:
        data_file = xlrd.open_workbook("../1_评价指标(含接口数据)/接口数据.xlsx")
    except:
        print("open excel file failed!")
    if(sheet_num==1):
        sheet = data_file.sheet_by_name("学生测验成绩")
    elif(sheet_num==2):
        sheet = data_file.sheet_by_name("学生动作数据")
    return sheet

#return 长度为n的数组，n为学生个数
def getGrade():
    sheet = open_excel(1)
    row_num = sheet.nrows
    grade = np.array(np.zeros(row_num-1))
    for i in range(1,row_num): #第0行是标题名，从第1行取值，共row_num行
        row_data = sheet.row_values(i)
        grade[i-1] = row_data[1] #第0列是学生名，第1列是测验成绩
    return grade

#return n行900列的矩阵，n为学生个数，900为一节课每个学生采集的数据数(3s采集一次，一节课45分钟)
def getMotion():
    sheet = open_excel(2)
    row_num = sheet.nrows
    column_num = 901
    motion_data = np.array(np.zeros((row_num-1,column_num-1))) #有row_num-1个学生，每个学生有column_num-1个动作数据
    for i in range(1,row_num): #第0行是标题名，从第1行取值，共row_num行
        row_data = sheet.row_values(i)
        for j in range(1,column_num):
            motion_data[i-1,j-1] = float(row_data[j])
    return motion_data

data = getMotion()
print("测验成绩：")
#print(data)
