import { ConflictException, Injectable } from '@nestjs/common';
import { CreateProcedureDto } from './dto/create-procedure.dto';
import { UpdateProcedureDto } from './dto/update-procedure.dto';
import { Procedure } from './entities/procedure.entity';
import { Repository } from 'typeorm';
import { InjectRepository } from '@nestjs/typeorm';
import { Step } from 'src/step/entities/step.entity';

@Injectable()
export class ProcedureService {
  constructor(
    @InjectRepository(Procedure)
    private procedureRepository: Repository<Procedure>,

    @InjectRepository(Step)
    private stepRepository: Repository<Step>,
  ) {}

  async create(createProcedureDto: CreateProcedureDto) {
    const { title, description, steps } = createProcedureDto;

    const procedure = new Procedure();
    procedure.title = title;
    procedure.description = description;

    const savedProcedure = await this.procedureRepository.save(procedure);

    const stepEntities = steps.map(stepDto => {
      const step = new Step();
      step.title = stepDto.title;
      step.doc = stepDto.doc;
      step.stepToFollow = stepDto.stepToFollow;
      step.isValidate = stepDto.isValidate;
      step.date = stepDto.date;
      step.procedure = savedProcedure;
      return step;
    });

    return await this.stepRepository.save(stepEntities);
  }

  async findAll() {
    return await this.procedureRepository.find({ relations: ['steps'] });
  }

  async findOne(id: number) {
    return await this.procedureRepository.findOne({where: { id } })
  }

  async update(id: number, updateProcedureDto: UpdateProcedureDto) {
    const toUpdate = await this.procedureRepository.findOne({ where: { id } });

    const updated = Object.assign(toUpdate, updateProcedureDto);

    return await this.procedureRepository.save(updated);
  }

  async remove(id: number) {
    return await this.procedureRepository.delete(id)
  }
}
