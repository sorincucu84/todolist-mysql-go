## Build
`docker build -t todolist .`

## Run
`docker run -p 4000:3000 --link mysql:mysql  --env host="tcp(mysql:3306)"  --name  todolist --rm todolist `