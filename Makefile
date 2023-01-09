postgres:
	docker run --name postgres14 -p 5432:5432 -e POSTGRES_USER=root -e POSTGRES_PASSWORD=password.1 -d postgres:14.5-alpine
createdb:
	docker exec -it postgres14 createdb --username=root --owner=root arsitopia
dropdb:
	docker exec -it postgres14 dropdb arsitopia
migrateup:
	migrate -path db/migration -database "postgresql://root:password.1@localhost:5432/arsitopia?sslmode=disable" -verbose up
migratedown:
	migrate -path db/migration -database "postgresql://root:password.1@localhost:5432/arsitopia?sslmode=disable" -verbose down	
sqlc:
	sqlc generate

.PHONY: postgres createdb dropdb migrateup migratedown sqlc		