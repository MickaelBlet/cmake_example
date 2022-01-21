#include <iostream>

#include "example1.h"

namespace lib1 {

Example::Example() {

}

Example::~Example() {

}

void Example::example(void) {
    std::cout << "example1" << std::endl;
}

} // namespace lib