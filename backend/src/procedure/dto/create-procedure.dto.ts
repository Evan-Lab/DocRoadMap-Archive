import { ApiProperty } from "@nestjs/swagger";
import { CreateStepDto } from "src/step/dto/create-step.dto";

export class CreateProcedureDto {
    @ApiProperty({
        type: String,
        description: "Name of the procedure (Required Property)"
    })
    public title: string;

    @ApiProperty({
        type: String,
        description: "Little description of the property"
    })
    public description: string;

    @ApiProperty({
        type: CreateStepDto,
        description: "List of step to follow to do the procedure (Required Property)"
    })
    public steps: CreateStepDto[];
}
