import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { StepService } from './step.service';
import { CreateStepDto } from './dto/create-step.dto';
import { UpdateStepDto } from './dto/update-step.dto';
import { ApiBadRequestResponse, ApiCreatedResponse, ApiNotFoundResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';

@Controller('step')
export class StepController {
  constructor(private readonly stepService: StepService) {}

  @Post('create')
  @ApiTags('Steps')
  @ApiCreatedResponse({
    description: 'Created Succesfully',
    type: CreateStepDto,
    isArray: false,
  })
  @ApiBadRequestResponse({ description: 'Bad Request' })
  create(@Body() createStepDto: CreateStepDto) {
    return this.stepService.create(createStepDto);
  }

  @Get('allStep')
  @ApiTags('Steps')
  @ApiOkResponse({
    type: CreateStepDto,
    isArray: true,
  })
  findAll() {
    return this.stepService.findAll();
  }

  @Get('oneStep/:id')
  @ApiTags('Steps')
  @ApiOkResponse({
    type: CreateStepDto,
    isArray: false,
  })
  @ApiNotFoundResponse({
    description: 'Not Found',
  })
  findOne(@Param('id') id: string) {
    return this.stepService.findOne(+id);
  }

  @Patch(':id')
  @ApiTags('Steps')
  @ApiOkResponse({
    type: CreateStepDto,
    isArray: false,
  })
  @ApiNotFoundResponse({
    description: 'Not Found',
  })
  @ApiBadRequestResponse({ description: 'Bad Request' })
  update(@Param('id') id: string, @Body() updateStepDto: UpdateStepDto) {
    return this.stepService.update(+id, updateStepDto);
  }

  @Delete('delete/:id')
  @ApiTags('Steps')
  @ApiOkResponse({
    description: 'Deleted Successfully',
  })
  @ApiNotFoundResponse({
    description: 'Not Found',
  })
  remove(@Param('id') id: string) {
    return this.stepService.remove(+id);
  }
}
