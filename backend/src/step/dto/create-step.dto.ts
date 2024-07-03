import { ApiProperty } from "@nestjs/swagger";

export class CreateStepDto {
    @ApiProperty({
        type: String,
        description: "Name of the step (Required Property)"
    })
    public title: string;

    @ApiProperty({
        type: String,
        description: "Admnistrative document to provide"
    })
    public doc: string;

    @ApiProperty({
        type: String,
        description: "Description of the different to follow in on particular step to do the procedure (Required Property)"
    })
    public stepToFollow: string;

    @ApiProperty({
        type: Boolean,
        description: "Step is validated or not ?"
    })
    public isValidate: boolean;

    @ApiProperty({
        type: Date,
        description: "[TEMP] Date to do the step (Date of a meeting)"
    })
    public date: Date;

    @ApiProperty({
        type: Number,
        description: "[Foreign Key] Id of the procedure associated (Required Property)"
    })
    public procedureId: number;
}
