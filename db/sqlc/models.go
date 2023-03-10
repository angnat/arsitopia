// Code generated by sqlc. DO NOT EDIT.
// versions:
//   sqlc v1.15.0

package db

import (
	"database/sql"
	"database/sql/driver"
	"fmt"
)

type ArsitopiaProductsStatus string

const (
	ArsitopiaProductsStatusOutOfStock ArsitopiaProductsStatus = "out_of_stock"
	ArsitopiaProductsStatusInStock    ArsitopiaProductsStatus = "in_stock"
	ArsitopiaProductsStatusRunningLow ArsitopiaProductsStatus = "running_low"
)

func (e *ArsitopiaProductsStatus) Scan(src interface{}) error {
	switch s := src.(type) {
	case []byte:
		*e = ArsitopiaProductsStatus(s)
	case string:
		*e = ArsitopiaProductsStatus(s)
	default:
		return fmt.Errorf("unsupported scan type for ArsitopiaProductsStatus: %T", src)
	}
	return nil
}

type NullArsitopiaProductsStatus struct {
	ArsitopiaProductsStatus ArsitopiaProductsStatus
	Valid                   bool // Valid is true if String is not NULL
}

// Scan implements the Scanner interface.
func (ns *NullArsitopiaProductsStatus) Scan(value interface{}) error {
	if value == nil {
		ns.ArsitopiaProductsStatus, ns.Valid = "", false
		return nil
	}
	ns.Valid = true
	return ns.ArsitopiaProductsStatus.Scan(value)
}

// Value implements the driver Valuer interface.
func (ns NullArsitopiaProductsStatus) Value() (driver.Value, error) {
	if !ns.Valid {
		return nil, nil
	}
	return ns.ArsitopiaProductsStatus, nil
}

type ArsitopiaArsitek struct {
	ID           int64          `json:"id"`
	Name         sql.NullString `json:"name"`
	CountryCode  sql.NullInt32  `json:"country_code"`
	Rating       sql.NullInt32  `json:"rating"`
	Createdate   sql.NullTime   `json:"createdate"`
	Createdby    sql.NullString `json:"createdby"`
	Modifieddate sql.NullTime   `json:"modifieddate"`
	Modifiedby   sql.NullString `json:"modifiedby"`
}

type ArsitopiaArsitekSkill struct {
	ID           int64          `json:"id"`
	IDArsitek    sql.NullInt64  `json:"id_arsitek"`
	IDSkill      sql.NullInt64  `json:"id_skill"`
	Createdate   sql.NullTime   `json:"createdate"`
	Createdby    sql.NullString `json:"createdby"`
	Modifieddate sql.NullTime   `json:"modifieddate"`
	Modifiedby   sql.NullString `json:"modifiedby"`
}

type ArsitopiaMerchants struct {
	ID           int64          `json:"id"`
	CountryCode  sql.NullInt32  `json:"country_code"`
	MerchantName sql.NullString `json:"merchant_name"`
	CreatedAt    sql.NullString `json:"created_at"`
	AdminID      sql.NullInt32  `json:"admin_id"`
}

type ArsitopiaOrderItems struct {
	OrderID   sql.NullInt32 `json:"order_id"`
	ProductID sql.NullInt32 `json:"product_id"`
	Quantity  sql.NullInt32 `json:"quantity"`
}

type ArsitopiaOrders struct {
	ID     int32          `json:"id"`
	UserID int32          `json:"user_id"`
	Status sql.NullString `json:"status"`
	// When order created
	CreatedAt sql.NullTime `json:"created_at"`
}

type ArsitopiaProductTags struct {
	ID   int32          `json:"id"`
	Name sql.NullString `json:"name"`
}

type ArsitopiaProductTagsProducts struct {
	ProductTagsID int32 `json:"product_tags_id"`
	ProductsID    int32 `json:"products_id"`
}

type ArsitopiaProducts struct {
	ID          int32                       `json:"id"`
	Name        sql.NullString              `json:"name"`
	MerchantID  int32                       `json:"merchant_id"`
	Price       sql.NullInt32               `json:"price"`
	Status      NullArsitopiaProductsStatus `json:"status"`
	Title       sql.NullString              `json:"title"`
	Image       sql.NullString              `json:"image"`
	Description sql.NullString              `json:"description"`
	Rating      sql.NullInt32               `json:"rating"`
	IsFavourite sql.NullBool                `json:"isFavourite"`
	Colors      []string                    `json:"colors"`
	CreatedAt   sql.NullTime                `json:"created_at"`
}

type ArsitopiaSkill struct {
	ID           int64          `json:"id"`
	SkillName    sql.NullString `json:"skill_name"`
	Createdate   sql.NullTime   `json:"createdate"`
	Createdby    sql.NullString `json:"createdby"`
	Modifieddate sql.NullTime   `json:"modifieddate"`
	Modifiedby   sql.NullString `json:"modifiedby"`
}

type Countries struct {
	Code          int32          `json:"code"`
	Name          sql.NullString `json:"name"`
	ContinentName sql.NullString `json:"continent_name"`
}

type Users struct {
	ID          int64          `json:"id"`
	FullName    sql.NullString `json:"full_name"`
	CreatedAt   sql.NullTime   `json:"created_at"`
	CountryCode sql.NullInt32  `json:"country_code"`
}
