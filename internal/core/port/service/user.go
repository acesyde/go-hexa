package service

import (
	"github.com/acesyde/hexaproject/internal/core/model/request"
	"github.com/acesyde/hexaproject/internal/core/model/response"
)

type UserService interface {
	SignUp(request *request.SignUpRequest) *response.Response
}
