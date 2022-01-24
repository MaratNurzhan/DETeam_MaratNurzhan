#строка с путем соединения к бд, прописываю логин/пароль к серверу подключения
$ConnectionString = "Data Source=de-team.database.windows.net;Initial Catalog=DE-Team-Marat-Nurzhan-DB;user=de-team-admin;password=DEpassword0"
#передаю путь в переменную 'SqlConnecion'
$SqlConnection = new-object system.data.SqlClient.SQLConnection($ConnectionString)
#строка содержит sql запрос на добавления строки в две таблица 'Lecturers', 'Students'
$query = @"
        INSERT INTO Lecturers VALUES('PhD'); 
        INSERT INTO Students VALUES('Engineering')
"@
#передаю запрос и путь соединения для выполнения данного запроса по заданному пути в бд 
$Sqlcommand = new-object system.data.sqlclient.sqlcommand($query,$SqlConnection)
#открываем соеднинение к бд
$SqlConnection.Open()
#выполняет запрос во время соединения с бд 
$Sqlcommand.ExecuteNonQuery()