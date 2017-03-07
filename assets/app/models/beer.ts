

export default class Beer {
    id:string;
    name:string;
    displayName:string;
    isOrganic:boolean;

    public constructor(beerData) {
        this.id = beerData.id;
        this.name = beerData.name;
        this.displayName = beerData.name_display;
        this.isOrganic = beerData.is_organic;
    }
}