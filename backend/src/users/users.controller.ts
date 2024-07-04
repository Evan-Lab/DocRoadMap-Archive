import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { UsersService } from './users.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';
import { ApiBadRequestResponse, ApiCreatedResponse, ApiNotFoundResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';

@Controller('users')
export class UsersController {
  constructor(private readonly usersService: UsersService) {}

  @Post('create')
  @ApiTags('User')
  @ApiCreatedResponse({
    description: 'Created Succesfully',
    type: CreateUserDto,
    isArray: false,
  })
  @ApiBadRequestResponse({ description: 'Bad Request' })
  create(@Body() createUserDto: CreateUserDto) {
    return this.usersService.create(createUserDto);
  }

  @Get('all')
  @ApiTags('User')
  @ApiOkResponse({
    type: CreateUserDto,
    isArray: true,
  })
  findAll() {
    return this.usersService.findAll();
  }

  @Get(':email')
  @ApiTags('User')
  @ApiOkResponse({
    type: CreateUserDto,
    isArray: false,
  })
  @ApiNotFoundResponse({
    description: 'Not Found',
  })
  findOne(@Param('email') email: string) {
    return this.usersService.findOne(email);
  }

  @Patch('update/:id')
  @ApiTags('User')
  @ApiOkResponse({
    type: CreateUserDto,
    isArray: false,
  })
  @ApiNotFoundResponse({
    description: 'Not Found',
  })
  @ApiBadRequestResponse({ description: 'Bad Request' })
  update(@Param('id') id: string, @Body() updateUserDto: UpdateUserDto) {
    return this.usersService.update(+id, updateUserDto);
  }

  @Delete('delete/:id')
  @ApiTags('User')
  @ApiOkResponse({
    description: 'Deleted Successfully',
  })
  @ApiNotFoundResponse({
    description: 'Not Found',
  })
  remove(@Param('id') id: string) {
    return this.usersService.remove(+id);
  }
}
