set (USE_INTERNAL_POCO_LIBRARY 1)

if (NOT EXISTS "${kvClient_SOURCE_DIR}/third_party/poco/CMakeLists.txt")
    message (WARNING "submodule contrib/poco is missing. to fix try run: \n git submodule update --init --recursive")
    set (USE_INTERNAL_POCO_LIBRARY 0)
endif ()

if (NOT USE_INTERNAL_POCO_LIBRARY)
    find_package (Poco REQUIRED Foundation Net JSON Util)
endif()

if (Poco_FOUND)
	message(STATUS "Using Poco: ${Poco_VERSION}, ${Poc_LIBRARIES}")
else ()
	message(STATUS "Poco Not Found")
endif()

message(STATUS "Using Poco: ${Poco_INCLUDE_DIRS} : ${Poco_Foundation_LIBRARY},${Poco_Util_LIBRARY},${Poco_Net_LIBRARY},${Poco_NetSSL_LIBRARY},${Poco_XML_LIBRARY},${Poco_Data_LIBRARY},${Poco_DataODBC_LIBRARY},${Poco_MongoDB_LIBRARY}; MongoDB=${Poco_MongoDB_FOUND}, DataODBC=${Poco_DataODBC_FOUND}, NetSSL=${Poco_NetSSL_FOUND}")
