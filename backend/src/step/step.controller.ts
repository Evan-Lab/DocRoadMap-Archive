import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { StepService } from './step.service';
import { CreateStepDto } from './dto/create-step.dto';
import { UpdateStepDto } from './dto/update-step.dto';
import { ApiTags } from '@nestjs/swagger';

@Controller('step')
export class StepController {
  constructor(private readonly stepService: StepService) {}

  @ApiTags('Steps')
  @Post('create')
  create(@Body() createStepDto: CreateStepDto) {
    return this.stepService.create(createStepDto);
  }

  @ApiTags('Steps')
  @Get('allStep')
  findAll() {
    return this.stepService.findAll();
  }

  @ApiTags('Steps')
  @Get('oneStep/:id')
  findOne(@Param('id') id: string) {
    return this.stepService.findOne(+id);
  }

  @ApiTags('Steps')
  @Patch(':id')
  update(@Param('id') id: string, @Body() updateStepDto: UpdateStepDto) {
    return this.stepService.update(+id, updateStepDto);
  }

  @ApiTags('Steps')
  @Delete('delete/:id')
  remove(@Param('id') id: string) {
    return this.stepService.remove(+id);
  }
}
