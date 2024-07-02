import { CreateStepDto } from "src/step/dto/create-step.dto";

export class CreateProcedureDto {
    public title: string;
    public description: string;
    public steps: CreateStepDto[];
}
