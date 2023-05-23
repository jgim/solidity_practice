// SPDX-License-Identifier: MIT
pragma solidity > 0.7.0 <= 0.9.0;

contract Dog {
    event Log(string message);

    function mung() public virtual {
        emit Log("Mung!");
    }
    /*
    	"from": "0xd9145CCE52D386f254917e481eB44e9943F39138",
		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
		"event": "Log",
		"args": {
			"0": "Mung!",
			"message": "Mung!"
		}
    */

    function bowwow() public virtual {
        emit Log("Bowwow!");
    }
    /*
    	"from": "0xd9145CCE52D386f254917e481eB44e9943F39138",
		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
		"event": "Log",
		"args": {
			"0": "Bowwow!",
			"message": "Bowwow!"
		}
    */
}


contract BigDog is Dog {
    function mung() public virtual override {
        emit Log("kwung kwung");
        Dog.mung();
    }
    /*
        {
            {
            "from": "0xDA0bab807633f07f013f94DD0E6A4F96F8742B53",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "kwung kwung",
                "message": "kwung kwung"
            }
        },
        {
            "from": "0xDA0bab807633f07f013f94DD0E6A4F96F8742B53",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "Mung!",
                "message": "Mung!"
            }
        }
    */

    function bowwow() public virtual override {
        emit Log("BoW! WoW!");
        super.bowwow();
    }
    /*
    {
    	{
		"from": "0xDA0bab807633f07f013f94DD0E6A4F96F8742B53",
		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
		"event": "Log",
		"args": {
			"0": "BoW! WoW!",
			"message": "BoW! WoW!"
		}
	},
	{
		"from": "0xDA0bab807633f07f013f94DD0E6A4F96F8742B53",
		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
		"event": "Log",
		"args": {
			"0": "Bowwow!",
			"message": "Bowwow!"
		}
	}
    */
}

contract SmallDog is Dog {
    function mung() public virtual override {
        emit Log("mang mang");
        Dog.mung();
    }
    /*
        {
            {
            "from": "0xd2a5bC10698FD955D1Fe6cb468a17809A08fd005",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "mang mang",
                "message": "mang mang"
            }
        },
        {
            "from": "0xd2a5bC10698FD955D1Fe6cb468a17809A08fd005",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "Mung!",
                "message": "Mung!"
            }
        }
    */

    function bowwow() public virtual override {
        emit Log("wow~ wow~ !");
        super.bowwow();
    }
    /*
        {
            "from": "0xd2a5bC10698FD955D1Fe6cb468a17809A08fd005",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "wow~ wow~ !",
                "message": "wow~ wow~ !"
            }
        },
        {
            "from": "0xd2a5bC10698FD955D1Fe6cb468a17809A08fd005",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "Bowwow!",
                "message": "Bowwow!"
            }
        }
    */
}

contract NormalDog is SmallDog, BigDog {

    function mung() public override(SmallDog, BigDog) {
        super.mung();
    }

    /*
        {
            {
            "from": "0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "kwung kwung",
                "message": "kwung kwung"
            }
        },
        {
            "from": "0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "Mung!",
                "message": "Mung!"
            }
        }
    */


    function bowwow() public override(SmallDog, BigDog) {
        super.bowwow();
    }
    /*
        {
            "from": "0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "BoW! WoW!",
                "message": "BoW! WoW!"
            }
        },
        {
            "from": "0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "wow~ wow~ !",
                "message": "wow~ wow~ !"
            }
        },
        {
            "from": "0xb27A31f1b0AF2946B7F582768f03239b1eC07c2c",
            "topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
            "event": "Log",
            "args": {
                "0": "Bowwow!",
                "message": "Bowwow!"
            }
        }
    */
}