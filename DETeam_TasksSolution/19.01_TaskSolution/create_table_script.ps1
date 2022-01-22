#строка с путем соединения к бд, прописываю логин/пароль к серверу подключения
$ConnectionString = "Data Source=de-team.database.windows.net;Initial Catalog=DE-Team-Marat-Nurzhan-DB;user=de-team-admin;password=DEpassword0"
#передаю путь в переменную 'SqlConnecion'
$SqlConnection = new-object system.data.SqlClient.SQLConnection($ConnectionString)
#строка содержит sql запрос на создание двух таблиц 'Lecturers', 'Students', запрос на создание таблицы можно выполнить заново,
#так как прописано условие на удаление таблицы, для повторного запуска скрипта на создание этих же новых таблиц
#в обеих таблицах есть ID элемент который начиная с 1000 инкрементируется на 1. 
#ID primary key потому что по ним идентифицируется уникальная строка каждого Лектора и Студента
$query = 
    "DROP TABLE IF EXISTS Lecturers; CREATE TABLE Lecturers (LecturerID bigint IDENTITY(1000,1) PRIMARY KEY, Academic_degree TEXT); DROP TABLE IF EXISTS Students; CREATE TABLE Students(StudentID bigint IDENTITY(1000,1) PRIMARY KEY, Faculty TEXT);"
#передаю запрос и путь соединения для выполнения данного запроса по заданному пути в бд   
$Sqlcommand = new-object system.data.sqlclient.sqlcommand($query,$SqlConnection)
#открываем соеднинение к бд
$SqlConnection.Open()
#выполняет запрос во время соединения с бд 
$Sqlcommand.ExecuteNonQuery()