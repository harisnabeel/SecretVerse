// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// import "hardhat/console.sol";

contract SV {
    uint256 tokenId = 0;
    uint256[] rarity_class_count = [2000, 3000, 3000, 1500, 500]; // index 0 = limit of vault with 5 traits, index 1 = limit of vault with 6 traits and so on..
    uint256[] rarity_class_count_tracker = [0, 0, 0, 0, 0]; // how much vaults of each rarity class are created, index 0 shows how much vaults are created of rarity class with 5 traits
    string[] private weapon = [
        "Lightsowrd",
        "PKD shooter",
        "Glaive",
        "Hammer",
        "Walther PPK",
        "Kriss Knife",
        "Phazer",
        " Whip",
        "Identity disc",
        "Jericho",
        "Two handed sowrd",
        "Proton Pack",
        "Lawgiver",
        "Vulcan",
        "Thermal Detonator",
        "Peacemaker",
        "Pirate's pistol",
        "Screwdriver",
        "Flamethrower",
        "Chakram",
        "Magic wand",
        "wizard's staff",
        "Repulsor",
        "Labrys",
        "Dagger"
    ];
    string[] private body = [
        "Jebi Knight",
        "Blade Rubber ",
        "Supervillan",
        "Autronaut",
        "Bounty hunter",
        "Terminator",
        "Princess",
        "General",
        "Android",
        "Stromtrigger",
        "Wizard",
        "Elf",
        "Orc",
        "Mutant",
        "Samorai",
        "Assasin",
        "Zombie",
        "Ninja",
        "Cowboy",
        "Ranger",
        "Smugller",
        "Hobbit",
        "Dwarf",
        "Thief",
        "APE"
    ];

    string[] private face = [
        "Luke Skyrunner",
        "Optimus Prick",
        "Bionic hand",
        "Captain America's Shield",
        "Boba jett",
        "Han Slomo",
        "Princess Leila Organics",
        "Dark Vaper",
        "Marni Mcfleet",
        "Oklahoma Smith",
        "Rocketeer Jetpack",
        "Ellen Ripley",
        "Triniti",
        " Sara Cloner",
        " Watch Phone",
        "Aragorn",
        "Harry Plotter",
        "Klarck Can't",
        "Katniss Evergreen",
        "Dana Scull",
        "James k Tirk",
        "Mr. Spoock",
        "Professor Y",
        "APE",
        "Utility Belt"
    ];
    string[] private city = [
        "Mars",
        "Emerald  city",
        "Hill Valley",
        "Dune",
        "Zion",
        "Metropolis",
        "Crypton",
        "Titan",
        "Arda",
        "Solaris",
        "luna",
        "Earth",
        "Jupiter",
        "Saturn",
        "Vega",
        "Venus",
        "Atlantis",
        "Asgard",
        "Bifrost",
        "Arrakis",
        "King;'s Landing",
        "Echo",
        "Neptun",
        "Pluto",
        "Uranus"
    ];
    string[] private transportation = [
        "Delorean",
        "speeder",
        "Millenia Falcon",
        "Serenity now",
        "Roger Young",
        "Nautiluss",
        "Night Rider",
        "Y wing",
        "USSR",
        "Catmobile",
        "Discovery two ",
        "Nosterdamos",
        "Prometheus",
        "Icarus II",
        "The Tardis ",
        "Batpod",
        "Light Cycle ",
        "Spinner ",
        "Mach 5 ",
        "Harley",
        "Nebuchadnezzar ",
        "Event Horizon",
        "Galactica",
        "Shadowfax",
        "Flying Dutchman"
    ];
    string[] private book = [
        "Lord of the Rings",
        "Dune",
        "Star oj Jypsies",
        "Frankenstein",
        "solaris",
        "The Moon is a Harsh Mistress",
        "Neuromancer",
        "Jurassic Park",
        "I Robot",
        "Ender's Game",
        "1984",
        "War of the Worlds",
        "The Hunger Games",
        "Fahrenheit 451",
        "Ringworld",
        "The Lion the Witch and the Wardrobe",
        "20000 Leagues Under The Sea",
        "A Wizard of Earthsea",
        "Starship Troopers",
        "A Game of Thrones",
        "Harry Potter and the Philosopher's Stone",
        "Brave New World",
        "Contact",
        "The Mote In God's Eye",
        "Do Androids Dream Of Electric Sheep?"
    ];
    string[] private game = [
        "Space Invaders",
        "Super Mario Bros.",
        "Final fantasy",
        "Space Quest",
        "Grand Theft Auto",
        "Mortal Combat",
        "The Legend Of Zelda",
        "Halo",
        "Street Fighter",
        "Tomb Raider",
        "Resident Evil",
        "Tetris",
        "Monkey Island",
        "Civilization",
        "Myst",
        "Sonic the Hedgehog",
        "Prince of Persia",
        "Pac Man",
        "Doom",
        "Galaga",
        "Sim City",
        "Donkey Kong",
        "Metroid",
        "King's Quest",
        "Zork"
    ];

    string[] private movie = [
        "2001: A Space Odyssey",
        "The princess Bride",
        "A Clockwork Orange",
        "The Empire Strikes Back",
        "Planet Of The Apes",
        "Back to the Future",
        "Jurassic Park",
        "Akira",
        "Alien",
        "Robocop",
        "Close Encounters Of The Third Kind",
        "Terminator 2",
        "Moonraker",
        "The Thing",
        "The Martian",
        "Blade Runner",
        "E.T.",
        "Predator",
        "The Abyss",
        "Invasion Of The Body Snatchers",
        "Avatar",
        "The Wrath Of Khan",
        "The Fly",
        "Metropolis",
        "The Matrix"
    ];
    string[] private element = [
        "Kryptonite",
        "Adamantite",
        "Chronoton",
        "Etherium",
        "Energon",
        "Mythril",
        "Orichalcum",
        "Radium",
        "Argon",
        "Iron",
        "Selenium",
        "Zirconium",
        "Xenon",
        "Uranium",
        "Thorium",
        "Radon",
        "Gold",
        "Silver",
        "Platinum",
        "Iridium",
        "Copper",
        "Oxygen",
        "Sodium",
        "Aluminum",
        "Diamond"
    ];

    // returns value of trait against and asked trait and tokenId
    function pluck(
        uint256 _tokenId,
        string memory traitName,
        string[] memory sourceArray
    ) internal pure returns (string memory) {
        //generate randomNumber against Asked trait and tokenId
        uint256 rand = random(
            string(abi.encodePacked(traitName, toString(_tokenId)))
        );
        string memory output = sourceArray[rand % sourceArray.length]; // rand % sourceArray.length gives a number < length of asked trait array, that number is the index of trait vaule to be returned

        return output;
    }

    // generates random number
    function random(string memory input) internal pure returns (uint256) {
        return uint256(keccak256(abi.encodePacked(input)));
    }

    event vaultCreated(string);

    // creates vault
    function createVault() external returns (string memory) {
        require(tokenId < 10000, "Cap Reached");
        tokenId++;
        bool isUncappedRandom; // flag against generated random number(which represents how much traits to generate per vault) whether its capp reached or not
        uint256 loopCounter = 0; // for randomness
        uint256 rarity_rand; // represents vaults with n traits, e.g 0 means vault with 5 traits , 1 = vault with 6 traits and so on..

        string[9] memory vault; // to hold traits of vault
        // generating traits that are mandatory
        vault[1] = pluck(tokenId, "Body", body);
        vault[0] = pluck(tokenId, "Weapon", weapon);
        vault[2] = pluck(tokenId, "Face", face);
        vault[3] = pluck(tokenId, "City", city);
        //rarity class means class of vaults having N number of traits, e.g 0 rarity class = vaults with 5 traits and so on..
        // generates random number for rarity class whose cap is not reached, e.g it will generate only that number whose rarity class cap is not reached
        while (!isUncappedRandom) {
            loopCounter++;
            rarity_rand = random(
                string(
                    abi.encodePacked(
                        toString(tokenId),
                        toString(loopCounter),
                        msg.sender
                    )
                )
            );
            rarity_rand %= 5; //  to create vault with returned number of traits. e.g 0 means vault with 5 traits , 1 means vault with 6 traits
            if (
                rarity_class_count_tracker[rarity_rand] <
                rarity_class_count[rarity_rand]
            ) {
                rarity_class_count_tracker[rarity_rand]++;
                isUncappedRandom = true;
            }
        }
        // @param rarity_rand = represents vault with rarity_rand + 5 traits
        bool[9] memory rand_arr = generateRandomArray(rarity_rand, tokenId); // ture in array represents trait against that index should be created . e.g 0th index means "BODY" trait , 4th index means "TRANSPORATION" trait

        if (rand_arr[4]) {
            vault[4] = pluck(tokenId, "Transportation", transportation);
        }
        if (rand_arr[5]) {
            vault[5] = pluck(tokenId, "Book", book);
        }
        if (rand_arr[6]) {
            vault[6] = pluck(tokenId, "Game", game);
        }
        if (rand_arr[7]) {
            vault[7] = pluck(tokenId, "Movie", movie);
        }
        if (rand_arr[8]) {
            vault[8] = pluck(tokenId, "Element", element);
        }
        // for testing
        string memory test = string(
            abi.encodePacked(
                vault[0],
                ",",
                vault[1],
                ",",
                vault[2],
                ",",
                vault[3],
                ",",
                vault[4],
                ",",
                vault[5],
                ",",
                vault[6],
                ",",
                vault[7],
                ",",
                vault[8]
            )
        );
        emit vaultCreated(test);
        // console.log(test);
        // console.log(vault[0]);
        // console.log(vault[1]);
        // console.log(vault[2]);
        // console.log(vault[3]);
        // console.log(vault[4]);
        // console.log(vault[5]);
        // console.log(vault[6]);
        // console.log(vault[7]);
        // console.log(vault[8]);
        return test;
    }

    function generateRandomArray(uint256 _length, uint256 _tokenId)
        public
        view
        returns (bool[9] memory)
    {
        bool[9] memory randomArray;
        uint256 check = 0; // keeping track of number of indexes of traits to be generated
        uint256 loopCounter = 0;
        while (check < _length + 1) {
            loopCounter++;
            uint256 rand = ((
                random(
                    string(
                        abi.encodePacked(
                            toString(_tokenId),
                            toString(loopCounter),
                            msg.sender
                        )
                    )
                )
            ) % (8 - 4 + 1)) + 4; // generating random no. b/w 4-8 (due to indexing of traits)
            if (randomArray[rand] == false) {
                check++;
                randomArray[rand] = true;
            }
        }

        return randomArray;
    }

    function getBody(uint256 _tokenId) public view returns (string memory) {
        return pluck(_tokenId, "Body", body);
    }

    function getWeapon(uint256 _tokenId) public view returns (string memory) {
        return pluck(_tokenId, "Weapon", weapon);
    }

    function getFace(uint256 _tokenId) public view returns (string memory) {
        return pluck(_tokenId, "Face", face);
    }

    function getCity(uint256 _tokenId) public view returns (string memory) {
        return pluck(_tokenId, "City", city);
    }

    function getTransportation(uint256 _tokenId)
        public
        view
        returns (string memory)
    {
        return pluck(_tokenId, "Transportation", transportation);
    }

    function getBook(uint256 _tokenId) public view returns (string memory) {
        return pluck(_tokenId, "Book", book);
    }

    function getGame(uint256 _tokenId) public view returns (string memory) {
        return pluck(_tokenId, "Game", game);
    }

    function getMovie(uint256 _tokenId) public view returns (string memory) {
        return pluck(_tokenId, "Movie", movie);
    }

    function getElement(uint256 _tokenId) public view returns (string memory) {
        return pluck(_tokenId, "Element", element);
    }

    function toString(uint256 value) internal pure returns (string memory) {
        // Inspired by OraclizeAPI's implementation - MIT license
        // https://github.com/oraclize/ethereum-api/blob/b42146b063c7d6ee1358846c198246239e9360e8/oraclizeAPI_0.4.25.sol

        if (value == 0) {
            return "0";
        }
        uint256 temp = value;
        uint256 digits;
        while (temp != 0) {
            digits++;
            temp /= 10;
        }
        bytes memory buffer = new bytes(digits);
        while (value != 0) {
            digits -= 1;
            buffer[digits] = bytes1(uint8(48 + uint256(value % 10)));
            value /= 10;
        }
        return string(buffer);
    }
}
