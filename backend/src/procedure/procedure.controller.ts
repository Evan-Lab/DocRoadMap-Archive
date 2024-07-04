import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { ProcedureService } from './procedure.service';
import { CreateProcedureDto } from './dto/create-procedure.dto';
import { UpdateProcedureDto } from './dto/update-procedure.dto';
import { ApiBadRequestResponse, ApiCreatedResponse, ApiNotFoundResponse, ApiOkResponse, ApiTags } from '@nestjs/swagger';

@Controller('procedure')
export class ProcedureController {
  constructor(private readonly procedureService: ProcedureService) {}

  @Post('create')
  @ApiTags('Procedure')
  @ApiCreatedResponse({
    description: 'Created Succesfully',
    type: CreateProcedureDto,
    isArray: false,
  })
  @ApiBadRequestResponse({ description: 'Bad Request' })
  @ApiNotFoundResponse({description: "Not Found Steps"})
  create(@Body() createProcedureDto: CreateProcedureDto) {
    return this.procedureService.create(createProcedureDto);
  }

  @Get('all')
  @ApiTags('Procedure')
  @ApiOkResponse({
    type: CreateProcedureDto,
    isArray: true,
  })
  findAll() {
    return this.procedureService.findAll();
  }

  @Get(':id')
  @ApiTags('Procedure')
  @ApiOkResponse({
    type: CreateProcedureDto,
    isArray: false,
  })
  @ApiNotFoundResponse({
    description: 'Not Found',
  })
  findOne(@Param('id') id: string) {
    return this.procedureService.findOne(+id);
  }

  @Patch('update/:id')
  @ApiTags('Procedure')
  @ApiOkResponse({
    type: CreateProcedureDto,
    isArray: false,
  })
  @ApiNotFoundResponse({
    description: 'Not Found',
  })
  @ApiBadRequestResponse({ description: 'Bad Request' })
  @ApiNotFoundResponse({description: "Not Found Steps"})
  update(@Param('id') id: string, @Body() updateProcedureDto: UpdateProcedureDto) {
    return this.procedureService.update(+id, updateProcedureDto);
  }

  @Delete('delete/:id')
  @ApiTags('Procedure')
  @ApiOkResponse({
    description: 'Deleted Successfully',
  })
  @ApiNotFoundResponse({
    description: 'Not Found',
  })
  remove(@Param('id') id: string) {
    return this.procedureService.remove(+id);
  }
}
