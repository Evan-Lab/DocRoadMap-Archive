export class CreateStepDto {
    public title: string;
    public doc: string;
    public stepToFollow: string;
    public isValidate: boolean;
    public date: Date;
    public procedureId: number;
}
