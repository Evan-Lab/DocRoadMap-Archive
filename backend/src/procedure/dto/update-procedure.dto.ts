import { PartialType } from '@nestjs/mapped-types';
import { CreateProcedureDto } from './create-procedure.dto';
import { ApiProperty, ApiPropertyOptional } from '@nestjs/swagger';
import { IsOptional, IsString } from 'class-validator';
import { CreateStepDto } from 'src/step/dto/create-step.dto';

export class UpdateProcedureDto extends PartialType(CreateProcedureDto) {
    @ApiPropertyOptional({
        type: String,
        description: 'Name of the procedure (Optional Property)',
        required: false
    })
    @IsOptional()
    @IsString()
    public title?: string;

    @ApiPropertyOptional({
        type: String,
        description: 'Little description of the property (Optional Property)',
        required: false
    })
    @IsOptional()
    @IsString()
    public description?: string;

    @ApiPropertyOptional({
        type: [CreateStepDto],
        description: 'List of steps to follow to do the procedure (Optional Property)',
        required: false
    })
    @IsOptional()
    public steps?: CreateStepDto[];
}
