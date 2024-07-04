import { Body, Controller, Post, HttpCode, HttpStatus } from '@nestjs/common';
import { AuthService } from './auth.service';
import { CreateUserDto } from 'src/users/dto/create-user.dto';
import { ApiBadRequestResponse, ApiConflictResponse, ApiNotFoundResponse, ApiOkResponse, ApiProperty, ApiTags } from '@nestjs/swagger';

export class SuccessLogin {
  @ApiProperty()
  access_token: string
}

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @HttpCode(HttpStatus.OK)
  @Post('login')
  @ApiTags('Authentication')
  @ApiOkResponse({
    description: "Success Login",
    type: SuccessLogin,
    isArray: false
  })
  @ApiNotFoundResponse({ description: "Invalid Email or Password" })
  signIn(@Body() signInDto: Record<string, any>) {
    return this.authService.signIn(signInDto.email, signInDto.password);
  }

  @HttpCode(HttpStatus.CREATED)
  @Post('register')
  @ApiTags('Authentication')
  @ApiOkResponse({
    description: "User registered",
    type: CreateUserDto,
    isArray: false
  })
  @ApiBadRequestResponse({
    description: "Bad Request"
  })
  @ApiConflictResponse({
    description: "Email already exist"
  })
  register(@Body() createUserDto: CreateUserDto) {
    return this.authService.register(createUserDto)
  }
}