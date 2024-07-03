import { PartialType } from '@nestjs/mapped-types';
import { CreateUserDto } from './create-user.dto';
import { ApiPropertyOptional } from '@nestjs/swagger';
import { IsOptional, IsString, IsEmail } from 'class-validator';

export class UpdateUserDto extends PartialType(CreateUserDto) {
    @ApiPropertyOptional({
        type: String,
        description: 'Firstname (Optional Property)',
        required: false,
    })
    @IsOptional()
    @IsString()
    public firstname?: string;

    @ApiPropertyOptional({
        type: String,
        description: 'Lastname (Optional Property)',
        required: false,
    })
    @IsOptional()
    @IsString()
    public lastname?: string;

    @ApiPropertyOptional({
        type: String,
        description: 'Email (Optional Property)',
        required: false,
    })
    @IsOptional()
    @IsEmail()
    public email?: string;

    @ApiPropertyOptional({
        type: String,
        description: 'Password (Optional Property)',
        required: false,
    })
    @IsOptional()
    @IsString()
    public password?: string;
}
