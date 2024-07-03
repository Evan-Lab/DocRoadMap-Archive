import { ApiProperty, ApiPropertyOptional } from "@nestjs/swagger";
import { IsOptional, IsString } from "class-validator";
import { CreateStepDto } from "src/step/dto/create-step.dto";

export class CreateProcedureDto {
    @ApiProperty({
        type: String,
        description: "Name of the procedure (Required Property)"
    })
    @IsString()
    public title: string;

    @ApiPropertyOptional({
        type: String,
        description: "Little description of the property"
    })
    @IsOptional()
    @IsString()
    public description: string;

    @ApiProperty({
        type: [CreateStepDto],
        description: "List of step to follow to do the procedure (Required Property)"
    })
    public steps: CreateStepDto[];
}
