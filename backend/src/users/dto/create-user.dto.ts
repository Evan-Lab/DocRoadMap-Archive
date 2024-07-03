import { ApiProperty } from "@nestjs/swagger";

export class CreateUserDto {
    @ApiProperty({
        type: String,
        description: "Firstname (Required Property)"
    })
    public firstname: string;

    @ApiProperty({
        type: String,
        description: "Lastname (Required Property)"
    })
    public lastname: string;

    @ApiProperty({
        type: String,
        description: "Email (Required Property)"
    })
    public email: string;

    @ApiProperty({
        type: String,
        description: "Password (Required Property)"
    })
    public password: string;
}
