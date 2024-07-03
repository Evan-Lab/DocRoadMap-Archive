import { PartialType } from '@nestjs/mapped-types';
import { CreateStepDto } from './create-step.dto';
import { ApiProperty } from '@nestjs/swagger';
import { IsOptional } from 'class-validator';

export class UpdateStepDto extends PartialType(CreateStepDto) {
    @ApiProperty({ description: 'The title of the step', required: false })
    @IsOptional()
    title?: string;

    @ApiProperty({ description: 'The document content', required: false })
    @IsOptional()
    doc?: string;

    @ApiProperty({ description: 'Instructions for the step', required: false })
    @IsOptional()
    stepToFollow?: string;

    @ApiProperty({ description: 'Indicates if the step is validated', required: false })
    @IsOptional()
    isValidate?: boolean;

    @ApiProperty({ description: 'The meeting date', required: false })
    @IsOptional()
    meetDate?: Date;

    @ApiProperty({ description: 'The validation date', required: false })
    @IsOptional()
    validateDate?: Date;
}
