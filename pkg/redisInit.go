package pkg

import (
	"context"
	"fmt"
	"log"
	"time"

	"github.com/go-redis/redis/v8"
)

var c Config

func InitClient(config Config) (err error) {
	c = config
	rdb = redis.NewClient(&redis.Options{
		Addr:     c.GetConnectAddr(),
		Password: c.Password,
		DB:       c.DB,
		PoolSize: 500,
	})
	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	_, err = rdb.Ping(ctx).Result()
	if err != nil {
		log.Printf("Connect Redis %s Failed", c.GetConnectAddr())
		return err
	}
	log.Printf("Connect Redis %s Successed. DB: %v", c.GetConnectAddr(), c.DB)
	return
}

func (c Config) GetConnectAddr() (connectAddr string) {
	return fmt.Sprintf("%s:%d", c.Addr, c.Port)
}
