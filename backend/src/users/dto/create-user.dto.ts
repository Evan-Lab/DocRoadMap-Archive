import { ApiProperty } from "@nestjs/swagger";
import { IsEmail, IsString } from "class-validator";

export class CreateUserDto {
    @ApiProperty({
        type: String,
        description: "Firstname (Required Property)"
    })
    @IsString()
    public firstname: string;

    @ApiProperty({
        type: String,
        description: "Lastname (Required Property)"
    })
    @IsString()
    public lastname: string;

    @ApiProperty({
        type: String,
        description: "Email (Required Property)"
    })
    @IsEmail()
    public email: string;

    @ApiProperty({
        type: String,
        description: "Password (Required Property)"
    })
    @IsString()
    public password: string;
}
