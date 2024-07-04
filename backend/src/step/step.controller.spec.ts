import { Test, TestingModule } from '@nestjs/testing';
import { StepController } from './step.controller';
import { StepService } from './step.service';

describe('StepController', () => {
  let controller: StepController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [StepController],
      providers: [StepService],
    }).compile();

    controller = module.get<StepController>(StepController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
