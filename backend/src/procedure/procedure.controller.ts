import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ProcedureService } from './procedure.service';
import { CreateProcedureDto } from './dto/create-procedure.dto';
import { UpdateProcedureDto } from './dto/update-procedure.dto';
import { ApiTags } from '@nestjs/swagger';

@Controller('procedure')
export class ProcedureController {
  constructor(private readonly procedureService: ProcedureService) {}

  @ApiTags('Procedure')
  @Post('create')
  create(@Body() createProcedureDto: CreateProcedureDto) {
    return this.procedureService.create(createProcedureDto);
  }

  @ApiTags('Procedure')
  @Get('allProcedure')
  findAll() {
    return this.procedureService.findAll();
  }

  @ApiTags('Procedure')
  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.procedureService.findOne(+id);
  }

  @ApiTags('Procedure')
  @Patch(':id')
  update(@Param('id') id: string, @Body() updateProcedureDto: UpdateProcedureDto) {
    return this.procedureService.update(+id, updateProcedureDto);
  }

  @ApiTags('Procedure')
  @Delete('delete/:id')
  remove(@Param('id') id: string) {
    return this.procedureService.remove(+id);
  }
}
