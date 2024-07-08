.PHONY: postgres createdb dropdb migrateup migratedown migrateup1 migratedown1 test server mock

postgres:
	docker run --name bank -p 5433:5432 -e POSTGRES_PASSWORD=root -d postgres:12.19-alpine

createdb:
	docker exec -it bank createdb --username=postgres --owner=postgres sky_ticket

dropdb: 
	docker exec -it bank dropdb --username=postgres --owner=postgres sky_ticket

migrateup:
	migrate -path db/migration -database "postgresql://postgres:root@localhost:5433/sky_ticket?sslmode=disable" -verbose up

migrateup1:
	migrate -path db/migration -database "postgresql://postgres:root@localhost:5433/sky_ticket?sslmode=disable" -verbose up 1

migratedown:
	migrate -path db/migration -database "postgresql://postgres:root@localhost:5433/sky_ticket?sslmode=disable" -verbose down

migratedown1:
	migrate -path db/migration -database "postgresql://postgres:root@localhost:5433/sky_ticket?sslmode=disable" -verbose down 1

sqlc:
	sqlc generate

test:
	go test -v -cover ./...

server:
	go run main.go

mock:
	mockgen -package mockdb -destination db/mock/store.go github.com/inzemam21/skyticket/db/sqlc Store

    