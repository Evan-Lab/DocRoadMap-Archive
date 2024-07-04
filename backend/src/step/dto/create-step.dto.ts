import { ApiProperty, ApiPropertyOptional } from "@nestjs/swagger";
import { IsBoolean, IsNumber, IsOptional, IsString } from "class-validator";

export class CreateStepDto {
    @ApiProperty({
        type: String,
        description: "Name of the step (Required Property)"
    })
    @IsString()
    public title: string;

    @ApiProperty({
        type: String,
        description: "Admnistrative document to provide"
    })
    @IsString()
    public doc: string;

    @ApiProperty({
        type: String,
        description: "Description of the different to follow in on particular step to do the procedure (Required Property)"
    })
    @IsString()
    public stepToFollow: string;

    @ApiProperty({
        type: Boolean,
        description: "Step is validated or not ?",
        default: false
    })
    @IsBoolean()
    public isValidate: boolean;

    @ApiPropertyOptional({
        type: Date,
        description: "[TEMP] Date to do the step (Date of a meeting)"
    })
    @IsOptional()
    public meetDate: Date;

    @ApiPropertyOptional({
        type: Date,
        description: "Date of validation of the step"
    })
    @IsOptional()
    public validateDate: Date;

    @ApiProperty({
        type: Number,
        description: "[Foreign Key] Id of the procedure associated (Required Property)"
    })
    @IsOptional()
    @IsNumber()
    public procedureId: number;
}
