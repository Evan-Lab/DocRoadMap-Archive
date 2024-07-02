import { Module, forwardRef } from '@nestjs/common';
import { StepService } from './step.service';
import { StepController } from './step.controller';
import { Step } from './entities/step.entity';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ProcedureModule } from 'src/procedure/procedure.module';

@Module({
  imports: [TypeOrmModule.forFeature([Step]), forwardRef(() => ProcedureModule)],
  controllers: [StepController],
  providers: [StepService],
  exports: [StepService, TypeOrmModule],
})
export class StepModule {}
