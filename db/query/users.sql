-- name: Createusers :one
INSERT INTO users (
    full_name,    
    country_code
) VALUES (
    $1, $2
) RETURNING *;

-- name: Getusers :one
SELECT * FROM users
WHERE id = $1 LIMIT 1;

-- name: GetusersForUpdate :one
SELECT * FROM users
WHERE id = $1 LIMIT 1
FOR NO KEY UPDATE;

-- name: Listusers :many
SELECT * FROM users
ORDER BY id
LIMIT $1
OFFSET $2;

-- name: Updateusers :one
UPDATE users
SET full_name = $2
WHERE id = $1
RETURNING *;

-- name: Deleteusers :exec
DELETE FROM users
WHERE id = $1;