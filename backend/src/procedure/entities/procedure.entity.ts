import { Step } from 'src/step/entities/step.entity';
import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Procedure {
    @PrimaryGeneratedColumn()
    id: number

    @Column('text')
    title: string

    @Column('text')
    description: string

    @OneToMany(() => Step, step => step.procedure)
    steps: Step[];
}
