import { Procedure } from "src/procedure/entities/procedure.entity";
import { Column, Entity, ManyToOne, PrimaryGeneratedColumn } from "typeorm";

@Entity()
export class Step {
    @PrimaryGeneratedColumn()
    id: number

    @Column('text')
    title: string

    @Column('text', {nullable: true})
    doc: string

    @Column('text')
    stepToFollow: string

    @Column({ default: false })
    isValidate: boolean

    @Column({ type: 'date', nullable: true })
    meetDate: Date

    @Column({ type: 'date', nullable: true })
    validateDate: Date

    @ManyToOne(() => Procedure, procedure => procedure.steps)
    procedure: Procedure;
}
