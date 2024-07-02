import { Module, forwardRef } from '@nestjs/common';
import { ProcedureService } from './procedure.service';
import { ProcedureController } from './procedure.controller';
import { Procedure } from './entities/procedure.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { StepModule } from 'src/step/step.module';

@Module({
  imports: [TypeOrmModule.forFeature([Procedure]), forwardRef(() => StepModule)],
  controllers: [ProcedureController],
  providers: [ProcedureService],
  exports: [ProcedureService, TypeOrmModule],
})
export class ProcedureModule {}
