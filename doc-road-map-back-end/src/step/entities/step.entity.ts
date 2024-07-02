import { Procedure } from "src/procedure/entities/procedure.entity";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Step {
    @PrimaryGeneratedColumn()
    id: number

    @Column('text')
    title: string

    @Column('text')
    doc: string

    @Column('text')
    stepToFollow: string

    @Column({ default: false })
    isValidate: boolean

    @Column({ type: 'date' })
    date: Date

    @ManyToOne(() => Procedure, procedure => procedure.steps)
    procedure: Procedure;
}
