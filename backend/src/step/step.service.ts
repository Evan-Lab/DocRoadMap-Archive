import { Injectable, NotFoundException } from '@nestjs/common';
import { CreateStepDto } from './dto/create-step.dto';
import { UpdateStepDto } from './dto/update-step.dto';
import { InjectRepository } from '@nestjs/typeorm';
import { Step } from './entities/step.entity';
import { Repository } from 'typeorm';
import { Procedure } from 'src/procedure/entities/procedure.entity';

@Injectable()
export class StepService {
  constructor(
    @InjectRepository(Step)
    private stepRepository: Repository<Step>,

    @InjectRepository(Procedure)
    private procedureRepository: Repository<Procedure>,
  ) {}

  async create(createStepDto: CreateStepDto) {
    const { procedureId, ...stepData } = createStepDto;

    const procedure = await this.procedureRepository.findOne({ where: { id: procedureId } })
    if (!procedure) {
      throw new NotFoundException(`Procedure with ID ${procedureId} not found`);
    }

    const step = this.stepRepository.create({
      ...stepData,
      procedure,
    });

    return await this.stepRepository.save(step);
  }

  async findAll() {
    return await this.stepRepository.find({ relations: ['procedure'] })
  }

  async findOne(id: number) {
    return await this.stepRepository.find({where: { id }})
  }

  async update(id: number, updateStepDto: UpdateStepDto) {
    const toUpdate = await this.stepRepository.findOne({ where: { id } });

    const updated = Object.assign(toUpdate, updateStepDto);

    return await this.stepRepository.save(updated);
  }

  async remove(id: number) {
    return await this.stepRepository.delete(id)
  }
}
